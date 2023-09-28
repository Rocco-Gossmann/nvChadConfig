---@type MappingsTable
local M = {}

M.splits = {
  n = {
    ["El"] = { ":vs<cr>", "new Right", opts = { nowait = true } },
    ["Eh"] = { ":vs<cr><C-w>h", "new Left", opts = { nowait = true } },
    ["Ej"] = { ":sp<cr>", " new Bottom", opts = { nowait = true } },
    ["Ek"] = { ":sp<cr><C-w>k", "new Top", opts = { nowait = true } },

    ["<C-h>"] = { function() require("nvim-tmux-navigation").NvimTmuxNavigateLeft() end, "go left", opts = { silent = true }, },
    ["<C-j>"] = { function() require("nvim-tmux-navigation").NvimTmuxNavigateDown() end, "go down", opts = { silent = true }, },
    ["<C-k>"] = { function() require("nvim-tmux-navigation").NvimTmuxNavigateUp() end, "go up", opts = { silent = true }, },
    ["<C-l>"] = { function() require("nvim-tmux-navigation").NvimTmuxNavigateRight() end, "go right", opts = { silent = true }, },

    --    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

M.global_marks = {
  n = {
    ["<leader>m1"] = { "mA", "set mark", opts = {} },
    ["<leader>m2"] = { "mB", "set mark", opts = {} },
    ["<leader>m3"] = { "mC", "set mark", opts = {} },
    ["<leader>m4"] = { "mD", "set mark", opts = {} },
    ["<leader>m5"] = { "mE", "set mark", opts = {} },
    ["<leader>m6"] = { "mF", "set mark", opts = {} },
    ["<leader>m7"] = { "mG", "set mark", opts = {} },
    ["<leader>m8"] = { "mH", "set mark", opts = {} },
    ["<leader>m9"] = { "mI", "set mark", opts = {} },
    ["<leader>m0"] = { "mJ", "set mark", opts = {} },

    ["m1"] = { "`A", "goto mark", opts = { silent = true } },
    ["m2"] = { "`B", "goto mark", opts = { silent = true } },
    ["m3"] = { "`C", "goto mark", opts = { silent = true } },
    ["m4"] = { "`D", "goto mark", opts = { silent = true } },
    ["m5"] = { "`E", "goto mark", opts = { silent = true } },
    ["m6"] = { "`F", "goto mark", opts = { silent = true } },
    ["m7"] = { "`G", "goto mark", opts = { silent = true } },
    ["m8"] = { "`H", "goto mark", opts = { silent = true } },
    ["m9"] = { "`I", "goto mark", opts = { silent = true } },
    ["m0"] = { "`J", "goto mark", opts = { silent = true } },
  },
}

M.visual_helpers = {
  x = {
    ["J"] = { ":m '>+1<CR>gv=gv", opts = { silent = true } },
    ["K"] = { ":m '<-2<CR>gv=gv", opts = { silent = true } },

    ["<C-r>"] = { ":s///gI<Left><Left><Left><Left>", opts = {} },
    ["<C-l>"] = { ":s/^\\(\\s\\{-\\}\\)//gI<Left><Left><Left><Left>", opts = {} },
  },
}

function noass() 
  return function ()
    print("shortcut not assigned anymore") 
  end 
end

M.general = {
  n = {
    --["<leader>fm"] = {"mzGVgg=`z", "Indent" },
    ["<leader>fm"] = { function () vim.lsp.buf.format() end , "format code", opts = {}},
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true hidden=true <CR>", "Find all" },
    ["<leader>fs"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fw"] = { noass(), "Live grep" },
  },
  v = {
    ["."] = { "c..<ESC>hmzplv`z", opts = { silent = true } },
    ['"'] = { 'c""<ESC>hmzplv`z', opts = { silent = true } },
    ["'"] = { "c''<ESC>hmzplv`z", opts = { silent = true } },
    ["("] = { "c()<ESC>hmzplv`z", opts = { silent = true } },
    ["["] = { "c[]<ESC>hmzplv`z", opts = { silent = true } },
    ["{"] = { "c{}<ESC>hmzplv`z", opts = { silent = true } },
    ["-"] = { "c--<ESC>hmzplv`z", opts = { silent = true } },
    ["_"] = { "c__<ESC>hmzplv`z", opts = { silent = true } },
    ["*"] = { "c**<ESC>hmzplv`z", opts = { silent = true } },
    ["~"] = { "c~~<ESC>hmzplv`z", opts = { silent = true } },
    ["/"] = { "c//<ESC>hmzplv`z", opts = { silent = true } },
  },
}

-- more keybinds!

return M
