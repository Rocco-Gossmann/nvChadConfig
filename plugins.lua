local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  --[[ Tmux - Naviation 
------------------------------------------------------------------------------]]
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    config = function()
      require("nvim-tmux-navigation").setup {}
    end,
  },

  --[[ Debuggers and Runners 
------------------------------------------------------------------------------]]
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = { "mfussenegger/nvim-dap" },
    config = function(_, opts)
      require("dapui").setup(opts)
      require "custom.configs.dap"
    end,
  },

  --[[ Database Clients
------------------------------------------------------------------------------]]
  { "kristijanhusak/vim-dadbod-ui", dependencies = {
    { "tpope/vim-dadbod" },
  } },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "mysql" },
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql" },
        command = [[setlocal omnifunc=vim_dadbod_competion#omni]],
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          vim.schedule(function()
            require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } }
          end)
        end,
      })
    end,
  },

  -- Override plugin definition options
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  { "williamboman/mason.nvim", opts = overrides.mason },

  { "nvim-treesitter/nvim-treesitter", opts = overrides.treesitter },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
