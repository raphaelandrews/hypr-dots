local M = {}

local KINDS = {
  class = "Class",
  interface = "Interface",
  enum = "Enum",
  record = "Record",
  annotation = "Annotation",
}

local SRC_MARKERS = { "src/main/java", "src/test/java", "src" }

-- Extract the Java package from an absolute directory path, e.g.
-- ".../src/main/java/com/example/vehicle" -> "com.example.vehicle".
local function package_from_abs(abs)
  local dir = abs:match("^(.*)/[^/]+$") or abs -- strip the file name
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

-- Decide where the new file goes and its package.
-- Anchoring to the current Java buffer's path makes this deterministic (package
-- follows the directory), falling back to the project source root otherwise.
local function base_plan()
  local fname = vim.api.nvim_buf_get_name(0)
  local abs = fname ~= "" and vim.fn.fnamemodify(fname, ":p") or ""
  if abs ~= "" and vim.fn.fnamemodify(abs, ":e") == "java" then
    local dir = abs:match("^(.*)/[^/]+$") or abs
    return dir, package_from_abs(abs)
  end
  local cwd = vim.fn.getcwd()
  for _, marker in ipairs(SRC_MARKERS) do
    local root = vim.fn.fnamemodify(cwd .. "/" .. marker, ":p")
    if vim.fn.isdirectory(root) == 1 then
      return root, nil
    end
  end
  local root = vim.fn.fnamemodify(cwd .. "/src/main/java", ":p")
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

function M.new_class(name, kind, components)
  kind = kind or "class"
  name = name or ""

  local dir, package = base_plan()
  local filepath = vim.fs.joinpath(dir, name .. ".java")

  if vim.fn.filereadable(filepath) == 1 then
    vim.notify("File already exists: " .. filepath, vim.log.levels.WARN)
    vim.cmd("edit " .. filepath)
    return
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
  if name and name ~= "" then
    M.new_class(name, kind or "class")
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
              M.new_class(nm, sel, cmp and cmp ~= "" and cmp or nil)
            end)
          else
            M.new_class(nm, sel)
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
