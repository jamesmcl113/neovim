return {
	"nvim-telescope/telescope.nvim",
	dependencies = { { "nvim-lua/plenary.nvim" } },
	opts = { pickers = { colorscheme = { enable_preview = true } } },
	config = function()
		require("telescope").setup {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					".git",
				},
			},
		}
	end,
}
