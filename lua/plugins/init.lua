return {
  "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- Colourscheme
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",      -- buffer completions
    "hrsh7th/cmp-path",        -- path completions
    "hrsh7th/cmp-cmdline",     -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions

  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
  },
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use


  -- Better Buffer deletion
  { "ojroques/nvim-bufdel" },

  {
    "christoomey/vim-tmux-navigator",
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}
