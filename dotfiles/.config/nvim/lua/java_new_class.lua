local M = {}

local KINDS = {
  class = "Class",
  interface = "Interface",
  enum = "Enum",
  record = "Record",
  annotation = "Annotation",
}

local SRC_MARKERS = { "src/main/java", "src/test/java", "src" }

-- Normalize a directory path: strip trailing slashes so later string work and
-- filepath joins don't produce "entities//Vehicle.java" or a trailing "." package.
local function strip_slash(dir)
  return (dir:gsub("/+$", "")):gsub("\\+$", "")
end

-- Extract the Java package from an absolute *directory* path, e.g.
-- ".../src/main/java/com/example/vehicle" -> "com.example.vehicle".
local function package_from_dir(dir)
  dir = strip_slash(dir)
  for _, marker in ipairs(SRC_MARKERS) do
    local needle = "/" .. marker .. "/"
    local idx = string.find(dir, needle, 1, true)
    if idx then
      local rest = dir:sub(idx + #needle)
      if rest ~= "" then
        return rest:gsub("/", ".")
      end
      return nil
    end
  end
  return nil
end

-- Package from a file path: strip the file name, then use the parent dir.
local function package_from_file(abs)
  local dir = abs:match("^(.*)/[^/]+$") or abs
  return package_from_dir(dir)
end

-- When focus is in the neo-tree files pane, return the directory of the node
-- currently selected (its own dir if it's a folder, its parent if it's a file).
local function neotree_selected_dir()
  local ok, manager = pcall(require, "neo-tree.sources.manager")
  if not ok then
    return nil
  end
  local ok_state, state = pcall(manager.get_state_for_window, vim.api.nvim_get_current_win())
  if not ok_state or not state or not state.tree then
    return nil
  end
  local ok_node, node = pcall(state.tree.get_node, state.tree)
  if not ok_node or not node or not node.path then
    return nil
  end
  if node.type == "directory" then
    return strip_slash(vim.fn.fnamemodify(node.path, ":p"))
  end
  return strip_slash(vim.fn.fnamemodify(vim.fn.fnamemodify(node.path, ":h"), ":p"))
end

-- Decide where the new file goes and its package. Priority:
--  1. the current Java buffer's directory (package follows the directory),
--  2. the folder selected in the neo-tree files pane,
--  3. the project source root under cwd (created on demand).
local function base_plan()
  local fname = vim.api.nvim_buf_get_name(0)
  local abs = fname ~= "" and vim.fn.fnamemodify(fname, ":p") or ""
  if abs ~= "" and vim.fn.fnamemodify(abs, ":e") == "java" then
    local dir = strip_slash(abs:match("^(.*)/[^/]+$") or abs)
    return dir, package_from_file(abs)
  end

  if vim.bo.filetype == "neo-tree" then
    local dir = neotree_selected_dir()
    if dir then
      return dir, package_from_dir(dir)
    end
  end

  local cwd = vim.fn.getcwd()
  for _, marker in ipairs(SRC_MARKERS) do
    local root = strip_slash(vim.fn.fnamemodify(cwd .. "/" .. marker, ":p"))
    if vim.fn.isdirectory(root) == 1 then
      return root, nil
    end
  end
  local root = strip_slash(vim.fn.fnamemodify(cwd .. "/src/main/java", ":p"))
  return root, nil
end

local function template(kind, name, components)
  local body
  if kind == "class" then
    body = "public class %s {\n    \n}\n"
  elseif kind == "interface" then
    body = "public interface %s {\n    \n}\n"
  elseif kind == "enum" then
    body = "public enum %s {\n    \n}\n"
  elseif kind == "record" then
    body = "public record %s(%s) {\n    \n}\n"
  elseif kind == "annotation" then
    body = "public @interface %s {\n    \n}\n"
  else
    body = "public class %s {\n    \n}\n"
  end
  return string.format(body, name, components or "")
end

---@param plan? {dir: string, package?: string} Precomputed target dir/package.
function M.new_class(name, kind, components, plan)
  kind = kind or "class"
  name = name or ""

  local dir, package
  if plan then
    dir, package = plan.dir, plan.package
  else
    dir, package = base_plan()
  end
  local filepath = vim.fs.joinpath(dir, name .. ".java")

  if vim.fn.filereadable(filepath) == 1 then
    vim.notify("File already exists: " .. filepath, vim.log.levels.WARN)
    vim.cmd("edit " .. filepath)
    return
  end

  -- The fallback source root may not exist yet (e.g. invoked from the project
  -- root with no src/main/java). Create the directory tree before writing.
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end

  local tpl = template(kind, name, components)
  if package then
    tpl = ("package %s;\n\n%s"):format(package, tpl)
  end
  vim.fn.writefile(vim.split(tpl, "\n"), filepath)
  vim.cmd("edit " .. filepath)
  vim.notify(("Created %s %s in %s"):format(KINDS[kind] or kind, name .. ".java", dir), vim.log.levels.INFO)
end

function M.java_new_class(name, kind)
  -- Capture the target dir/package up front so a focus shift during the input
  -- prompts (e.g. neo-tree selection) does not change where the file lands.
  local plan_dir, plan_pkg = base_plan()
  local plan = { dir = plan_dir, package = plan_pkg }

  if name and name ~= "" then
    M.new_class(name, kind or "class", nil, plan)
    return
  end
  -- Interactive: pick type, then name.
  local kinds = vim.list_extend({}, vim.tbl_keys(KINDS))
  table.sort(kinds)
  vim.ui.select(kinds, { prompt = "Java type to generate:" }, function(sel)
    if sel then
      vim.ui.input({ prompt = (KINDS[sel] or sel) .. " name: " }, function(nm)
        if nm and nm ~= "" then
          if sel == "record" then
            vim.ui.input({ prompt = "Record components (e.g. String name, int age): " }, function(cmp)
              M.new_class(nm, sel, cmp and cmp ~= "" and cmp or nil, plan)
            end)
          else
            M.new_class(nm, sel, nil, plan)
          end
        end
      end)
    end
  end)
end

vim.api.nvim_create_user_command("JavaNewClass", function(opts)
  local args = vim.trim(opts.args)
  if args == "" then
    M.java_new_class()
  else
    local parts = vim.split(args, "%s+")
    local first = parts[1] and parts[1]:lower() or ""
    if KINDS[first] then
      -- :JavaNewClass <kind> <name>
      M.java_new_class(parts[2] or parts[1], first)
    else
      -- :JavaNewClass <name>  (class by default)
      M.java_new_class(first, "class")
    end
  end
end, { nargs = "*", desc = "New Java type (class/interface/enum/record/annotation)" })

return M
