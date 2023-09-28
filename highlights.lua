-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
--  Comment = {
--    italic = true,
--  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

--vim.api.nvim_set_hl(0, "Comment", {bg = "none", fg="#a0a0a0"})
--vim.api.nvim_set_hl(0, "Conditional", {bg = "none", fg="#d7afff"})
--vim.api.nvim_set_hl(0, "@parameter", {bg = "none", fg="#ff87af"})
--vim.api.nvim_set_hl(0, "@tag.attribute", {bg = "none", fg="#87d7d7"})
--vim.api.nvim_set_hl(0, "@text.uri", {bg = "none", fg="#ffd7d7"})

return M

