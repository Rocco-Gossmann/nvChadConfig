local function recurse(tab1, tab2)
  if type(tab2) ~= "table" then
    return tab2
  end

  for k, v in pairs(tab2) do
    if type(tab1[k]) == "table" then
      tab1[k] = recurse(tab1[k], v)
    else
      tab1[k] = v
    end
  end

  return tab1
end

local function attachSettings(defSettings, file)
  if vim.fn.findfile(file) ~= "" then
    local tab2 = dofile(file)
    if type(tab2) ~= "table" then
      print("given lsp settings by '" .. file .. "' are not a table")
      return defSettings
    end
    return recurse(defSettings, dofile(file))
  else
    return defSettings
  end
end


local function appendSetup(su, lspName)
  local defaultSettings = {}
  if pcall(require, "custom.lsp." .. lspName) then
    defaultSettings = require("custom.lsp." .. lspName)
  end

  su = recurse(su, defaultSettings)
  su = attachSettings(su.settings, vim.fn.getcwd() .. "/.nvim/" .. lspName .. ".settings.lua")

  return su
end

return {
  appendSetup = appendSetup,
}
