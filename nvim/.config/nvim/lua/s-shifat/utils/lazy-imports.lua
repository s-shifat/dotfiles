local M = {}

local function scandir(path)
  local handle = vim.loop.fs_scandir(path)
  local result = {}

  if not handle then
    return result
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then break end
    table.insert(result, { name = name, type = type })
  end

  return result
end

M.generate_imports = function()
  local imports = {}
  local base = "s-shifat.plugins"
  local base_path = vim.fn.stdpath("config") .. "/lua/" .. base:gsub("%.", "/")

  for _, entry in ipairs(scandir(base_path)) do
    if entry.type == "file" and entry.name:match("%.lua$") then
      -- flat file: plugins/foo.lua
      local name = entry.name:gsub("%.lua$", "")
      table.insert(imports, { import = base .. "." .. name })

    elseif entry.type == "directory" then
      local sub = entry.name
      local full_path = string.format("%s/%s/%s.lua", base_path, sub, sub)
      local stat = vim.loop.fs_stat(full_path)

      if stat and stat.type == "file" then
        -- only import if subfolder contains plugin_name/plugin_name.lua
        table.insert(imports, { import = base .. "." .. sub })
      end
    end
  end

  return imports
end

return M
