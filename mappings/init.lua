---@type MappingsTable
local M = {}

local fileTypeMappings = require "custom.mappings.filetypes"

local function noass()
  return function()
    print "shortcut not assigned anymore"
  end
end

local function ftMappings(m, mo)
  return function()
    local ft = vim.bo.filetype
    if fileTypeMappings[ft] ~= nil and fileTypeMappings[ft][mo] ~= nil and fileTypeMappings[ft][mo][m] ~= nil then
      local fn = fileTypeMappings[ft][mo][m]
      local tfn = type(fn)
      if tfn == "table" then
        for _, v in pairs(fn) do
          local tv = type(v)
          if tv == "string" then
            local keys = vim.api.nvim_replace_termcodes(v, true, false, true)
            vim.api.nvim_feedkeys(keys, mo, false)
          elseif tv == "function" then
            v()
          end
        end
      end

      if tfn == "string" then
        local keys = vim.api.nvim_replace_termcodes(fn, true, false, true)
        vim.api.nvim_feedkeys(keys, mo, false)
      elseif tfn == "function" then
        fn()
      end
    end
  end
end

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

M.general = {
  n = {
    --["<leader>fm"] = {"mzGVgg=`z", "Indent" },
    ["<leader>fm"] = { vim.lsp.buf.format, "format code", opts = {} },
    ["<leader>ff"] = { "<cmd> Telescope find_files follow=true hidden=true <CR>", "Find all" },
    ["<leader>fs"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>fw"] = { noass(), "-" },

    ["<leader>cd"] = { vim.diagnostic.open_float, "code diagnostic", opts = {} },
    ["<leader>h"] = { vim.lsp.buf.hover, "show hover", opts = {} },

    ["<leader>ra"] = { noass(), "-" },
    ["<leader>cr"] = {
      function()
        require("nvchad.renamer").open()
      end,
      "LSP rename",
    },

    ["<S-l>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },

    ["<S-h>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto next buffer",
    },

	["<leader><S-m>"] = {
			"<cmd> DBUIToggle <CR>",
			"MySQL Client"
			},

    ["q-"] = { ftMappings("q-", "n") },
    ["q."] = { ftMappings("q.", "n") },
    ["q,"] = { ftMappings("q,", "n") },
    ["q<enter>"] = { ftMappings("q<enter>,", "n") },
    ["qa"] = { ftMappings("qa", "n") },
    ["qb"] = { ftMappings("qb", "n") },
    ["qc"] = { ftMappings("qc", "n") },
    ["qd"] = { ftMappings("qd", "n") },
    ["qe"] = { ftMappings("qe", "n") },
    ["qf"] = { ftMappings("qf", "n") },
    ["qg"] = { ftMappings("qg", "n") },
    ["qh"] = { ftMappings("qh", "n") },
    ["qi"] = { ftMappings("qi", "n") },
    ["qj"] = { ftMappings("qj", "n") },
    ["qk"] = { ftMappings("qk", "n") },
    ["ql"] = { ftMappings("ql", "n") },
    ["qm"] = { ftMappings("qm", "n") },
    ["qn"] = { ftMappings("qn", "n") },
    ["qo"] = { ftMappings("qo", "n") },
    ["qp"] = { ftMappings("qp", "n") },
    ["qq"] = { ftMappings("qq", "n") },
    ["qr"] = { ftMappings("qr", "n") },
    ["qs"] = { ftMappings("qs", "n") },
    ["qt"] = { ftMappings("qt", "n") },
    ["qu"] = { ftMappings("qu", "n") },
    ["qv"] = { ftMappings("qv", "n") },
    ["qw"] = { ftMappings("qw", "n") },
    ["qx"] = { ftMappings("qx", "n") },
    ["qy"] = { ftMappings("qy", "n") },
    ["qz"] = { ftMappings("qz", "n") },
    ["q1"] = { ftMappings("q1", "n") },
    ["q2"] = { ftMappings("q2", "n") },
    ["q3"] = { ftMappings("q3", "n") },
    ["q4"] = { ftMappings("q4", "n") },
    ["q5"] = { ftMappings("q5", "n") },
    ["q6"] = { ftMappings("q6", "n") },
    ["q7"] = { ftMappings("q7", "n") },
    ["q8"] = { ftMappings("q8", "n") },
    ["q9"] = { ftMappings("q9", "n") },
    ["q0"] = { ftMappings("z0", "n") },
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

    ["q-"] = { ftMappings("q-", "v") },
    ["q."] = { ftMappings("q.", "v") },
    ["q,"] = { ftMappings("q,", "v") },
    ["q<enter>"] = { ftMappings("q<enter>,", "v") },
    ["qa"] = { ftMappings("qa", "v") },
    ["qb"] = { ftMappings("qb", "v") },
    ["qc"] = { ftMappings("qc", "v") },
    ["qd"] = { ftMappings("qd", "v") },
    ["qe"] = { ftMappings("qe", "v") },
    ["qf"] = { ftMappings("qf", "v") },
    ["qg"] = { ftMappings("qg", "v") },
    ["qh"] = { ftMappings("qh", "v") },
    ["qi"] = { ftMappings("qi", "v") },
    ["qj"] = { ftMappings("qj", "v") },
    ["qk"] = { ftMappings("qk", "v") },
    ["ql"] = { ftMappings("ql", "v") },
    ["qm"] = { ftMappings("qm", "v") },
    ["qn"] = { ftMappings("qn", "v") },
    ["qo"] = { ftMappings("qo", "v") },
    ["qp"] = { ftMappings("qp", "v") },
    ["qq"] = { ftMappings("qq", "v") },
    ["qr"] = { ftMappings("qr", "v") },
    ["qs"] = { ftMappings("qs", "v") },
    ["qt"] = { ftMappings("qt", "v") },
    ["qu"] = { ftMappings("qu", "v") },
    ["qv"] = { ftMappings("qv", "v") },
    ["qw"] = { ftMappings("qw", "v") },
    ["qx"] = { ftMappings("qx", "v") },
    ["qy"] = { ftMappings("qy", "v") },
    ["qz"] = { ftMappings("qz", "v") },
    ["q1"] = { ftMappings("q1", "v") },
    ["q2"] = { ftMappings("q2", "v") },
    ["q3"] = { ftMappings("q3", "v") },
    ["q4"] = { ftMappings("q4", "v") },
    ["q5"] = { ftMappings("q5", "v") },
    ["q6"] = { ftMappings("q6", "v") },
    ["q7"] = { ftMappings("q7", "v") },
    ["q8"] = { ftMappings("q8", "v") },
    ["q9"] = { ftMappings("q9", "v") },
    ["q0"] = { ftMappings("z0", "v") },
  },
}

-- more keybinds!

return M
