-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.nrformats:append "alpha"

vim.opt.grepprg = "rg -n -i -g -L --ignore-file .rgignore $* /dev/null"

vim.opt.cursorline = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.api.nvim_create_autocmd("BufAdd", {
  callback = function()
    vim.schedule(function()
      vim.opt.foldlevelstart = 99
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end)
  end,
})

local projectInitFile = vim.fn.getcwd() .. "/.nvim/init.lua"
if vim.fn.findfile(projectInitFile) ~= "" then
  local fn = dofile(projectInitFile)
  local fnt = type(fn)

  if fnt == "function" then
    vim.schedule(fn)
  end
end
