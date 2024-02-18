return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end

    vim.filetype.add { extension = { wgsl = "wgsl" } }

    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.wgsl = {
      install_info = {
        url = "https://github.com/szebniok/tree-sitter-wgsl",
        files = { "src/parser.c" },
      },
    }

    -- Set tab size for .wgsl files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "wgsl",
      command = "setlocal shiftwidth=4 tabstop=4",
    })

    configs.setup {
      ensure_installed = { "lua", "javascript", "json", "wgsl", "rust" },
      sync_install = false,
      ignore_install = { "" },
      highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
      },
      indent = { enable = true, disable = { "yaml" } },
    }
  end,
}
