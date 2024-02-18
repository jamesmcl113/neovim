return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	opts = function()
		local dashboard = require "alpha.themes.dashboard"
		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl_shortcut = "@alpha.key_bind"
			return b
		end
		local logo = [[
                                        $$\
                                        \__|
$$$$$$$\   $$$$$$\   $$$$$$\ $$\    $$\ $$\ $$$$$$\$$$$\
$$  __$$\ $$  __$$\ $$  __$$\\$$\  $$  |$$ |$$  _$$  _$$\
$$ |  $$ |$$$$$$$$ |$$ /  $$ |\$$\$$  / $$ |$$ / $$ / $$ |
$$ |  $$ |$$   ____|$$ |  $$ | \$$$  /  $$ |$$ | $$ | $$ |
$$ |  $$ |\$$$$$$$\ \$$$$$$  |  \$  /   $$ |$$ | $$ | $$ |
\__|  \__| \_______| \______/    \_/    \__|\__| \__| \__|
      ]]
		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.header.opts.hl = "@alpha.title"
		dashboard.section.buttons.val = {
			{
				type = "text",
				val = " ",
				opts = {
					position = "center",
				},
			},
			{ type = "padding", val = 2 },
			button("f", " " .. " Open file", ":lua require('telescope.builtin').find_files()<CR>"),
			button("e", " " .. " File tree", ":NvimTreeToggle <CR>"),
			button("l", " " .. " LSP's", ":Mason<CR>"),
			button("p", " " .. " Plugins", ":Lazy<CR>"),
			button("c", " " .. " Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			button("q", " " .. " Quit", ":qa<CR>"),
		}
		dashboard.opts.layout[1].val = 4
		dashboard.opts.layout[3].val = 0
		dashboard.section.footer.val = "Now I will have less distraction.\n- Leonhard Euler"
		dashboard.section.footer.opts.hl = "@alpha.footer"
		table.insert(dashboard.config.layout, 5, {
			type = "padding",
			val = 1,
		})
		return dashboard
	end,
	config = function(_, dashboard)
		-- close Lazy and re-open when the dashboard is ready
		if vim.o.filetype == "lazy" then
			vim.cmd.close()
			vim.api.nvim_create_autocmd("User", {
				pattern = "AlphaReady",
				callback = function()
					require("lazy").show()
				end,
			})
		end

		require("alpha").setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.buttons.val[1].val = "󱐋 Loaded " .. stats.count .. " plugins in " .. ms .. "ms"
				dashboard.section.buttons.val[1].opts.hl = "@alpha.header"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
