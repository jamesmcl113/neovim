return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "kyazdani42/nvim-web-devicons",
  config = function()
    vim.opt.termguicolors = true
    require("bufferline").setup {
      options = {
        seperator_style = "slope",
        close_icon = "X",
        buffer_close_icon = "X",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    }
  end,
}
