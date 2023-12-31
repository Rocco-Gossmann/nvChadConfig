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

local function printRecursive(t, indent)
  indent = indent or ""
  for k, v in pairs(t) do
    if type(v) == "table" then
      vim.api.nvim_buf_set_lines(0, -1, -1, false, {indent .. k .. ":"})
      printRecursive(v, indent .. "  ")
    else
      vim.api.nvim_buf_set_lines(0, -1, -1, false, { indent .. k .. ": " .. tostring(v)})
    end
  end
end

local function appendSetup(su, lspName)
  local defaultSettings = {}
  if pcall(require, "custom.lsp." .. lspName) then
    defaultSettings = require("custom.lsp." .. lspName)
  end

  su = recurse(su, defaultSettings)
  su.settings = attachSettings(su.settings, vim.fn.getcwd() .. "/.nvim/" .. lspName .. ".settings.lua")

  return su
end

local function __DIR__()
	return debug.getinfo(3).source:match("@?(.*/)")
end

return {
  appendSetup = appendSetup,
  printRecursive = printRecursive,
	__DIR__ = __DIR__
}
