local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local cutils = require("custom.utils")
local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "gopls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
	settings = cutils.loadServerSettings(lsp)
  }
end

------------------------------------------------------------------------------[[
-- Go LSP
------------------------------------------------------------------------------]]
local projectLSPFile = vim.fn.getcwd() .. "/.nvim/lsp.lua"
if vim.fn.findfile(projectLSPFile) ~= "" then
  local fn = dofile(projectLSPFile)
  local fnt = type(fn)

  if fnt == "function" then
    fn(lspconfig, on_attach, capabilities)
  end
end
