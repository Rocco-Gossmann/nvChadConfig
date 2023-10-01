---@type MappingsTable
local M = {}

M.debugging = {
  n = {
    ["<leader>d<space>"] = {
      function()
        require("dapui").eval()
      end,
      "Debug: Eval",
    },
    ["<leader>db"] = { vim.cmd.DapToggleBreakpoint, "Debug: Toggle Breakpoint" },
    ["<leader>ds"] = {
      function()
        local dap = require "dap"
        local dapui = require "dapui"
        vim.inspect(dap)
        dapui.open()
        vim.cmd.DapContinue()
      end,
      "Debug: Start/Continue",
    },
    ["<leader>dh"] = { vim.cmd.DapStepInto, "Debug: Step into" },
    ["<leader>dj"] = { vim.cmd.DapStepOver, "Debug: Step over" },
    ["<leader>dk"] = { vim.cmd.DapStepOut, "Debug: Step out" },
    ["<leader>dd"] = {
      function()
        require("dapui").close()
        vim.cmd.DapTerminate()
      end,
      "Debug: Stop",
    },
  },
}

M.splits = {
  n = {
    ["El"] = { "<cmd> vs<cr>", "new Right", opts = { nowait = true } },
    ["Eh"] = { "<cmd> vs<cr><C-w>h", "new Left", opts = { nowait = true } },
    ["Ej"] = { "<cmd> sp<cr>", " new Bottom", opts = { nowait = true } },
    ["Ek"] = { "<cmd> sp<cr><C-w>k", "new Top", opts = { nowait = true } },

    ["<C-h>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
      end,
      "go left",
      opts = { silent = true },
    },
    ["<C-j>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateDown()
      end,
      "go down",
      opts = { silent = true },
    },
    ["<C-k>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateUp()
      end,
      "go up",
      opts = { silent = true },
    },
    ["<C-l>"] = {
      function()
        require("nvim-tmux-navigation").NvimTmuxNavigateRight()
      end,
      "go right",
      opts = { silent = true },
    },

    ["<C-Left>"] = { "<C-w><", "Grow Horizontal", opts = {} },
    ["<C-Right>"] = { "<C-w>>", "Shrink Horizontal", opts = {} },
    ["<C-Up>"] = { "<C-w>-", "Shrink Vertical", opts = {} },
    ["<C-DOwn>"] = { "<C-w>+", "Grow Vertical", opts = {} },

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
  return function()
    print "shortcut not assigned anymore"
  end
end

M.general = {
  n = {
    --["<leader>fm"] = {"mzGVgg=`z", "Indent" },
    ["<leader>fm"] = { vim.lsp.buf.format, "format code", opts = {} },
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true hidden=true <CR>", "Find all" },
    ["<leader>fs"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fw"] = { noass(), "-" },

    ["<leader>cd"] = { vim.diagnostic.open_float, "code diagnostic", opts = {} },
    ["<leader>h"] = { vim.lsp.buf.hover, "show hover", opts = {} },
  },

  i = {
    ["<C-h>"] = {
      vim.lsp.buf.signature_help,
      "show completion",
      opts = {},
    },
    ["<C-j>"] = {
      vim.lsp.buf.completion,
      "show completion",
      opts = {},
    },

    ["<C-l>"] = { noass(), "-" },
    ["<C-k>"] = { noass(), "-" },
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
