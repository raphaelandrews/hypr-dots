local M = {}

local function find_csproj()
  return vim.fs.find({ "*.csproj" }, { path = vim.fn.getcwd(), upward = true, limit = 1 })[1]
end

local function read_root_namespace(csproj_path)
  for _, line in ipairs(vim.fn.readfile(csproj_path)) do
    local ns = line:match("<RootNamespace>(.-)</RootNamespace>")
    if ns then
      return ns
    end
  end
  return vim.fs.basename(csproj_path):gsub("%.csproj$", "")
end

local function infer_namespace()
  local csproj = find_csproj()
  if not csproj then
    return nil
  end

  local base_ns = read_root_namespace(csproj)
  local root = vim.fs.dirname(csproj)
  local cwd = vim.fn.getcwd()

  if cwd ~= root then
    local rel = vim.fs.relpath(cwd, root)
    if rel and rel ~= "." then
      return base_ns .. "." .. rel:gsub("/", ".")
    end
  end
  return base_ns
end

function M.generate_class(name, namespace)
  local template
  if namespace then
    template = string.format(
      "namespace %s;\n\npublic class %s\n{\n    \n}\n",
      namespace,
      name
    )
  else
    template = string.format(
      "public class %s\n{\n    \n}\n",
      name
    )
  end

  local filepath = vim.fn.getcwd() .. "/" .. name .. ".cs"

  if vim.fn.filereadable(filepath) == 1 then
    vim.notify("File already exists: " .. name .. ".cs", vim.log.levels.WARN)
    vim.cmd("edit " .. filepath)
    return
  end

  vim.fn.writefile(vim.split(template, "\n"), filepath)
  vim.cmd("edit " .. filepath)
  vim.notify("Created: " .. name .. ".cs", vim.log.levels.INFO)
end

function M.csharp_new_class(name)
  local class_name = name
  if not class_name or class_name == "" then
    vim.ui.input({ prompt = "Class name: " }, function(input)
      if input and input ~= "" then
        M.generate_class(input, infer_namespace())
      end
    end)
  else
    M.generate_class(class_name, infer_namespace())
  end
end

vim.api.nvim_create_user_command("CsharpNewClass", function(opts)
  M.csharp_new_class(opts.args)
end, { nargs = "?" })

return M
