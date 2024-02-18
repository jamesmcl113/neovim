return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  opts = {
    theme = "gruvbox-material",
    sections = {
      lualine_c = {
        {
          "filename",
          path = 1,
        },
      },
    },
  },
}
