local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- Set Space as <leader>
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
keymap("n", "<C-l>", "<cmd> TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-h>", "<cmd> TmuxNavigateRight<CR>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)

-- BufDel
keymap("n", "<C-c>", "<cmd>BufDel<cr>", opts)

local lsp_or_leptos = function()
	-- Handle to the current buffer
	local filetype = vim.filetype.match { buf = 0 }
	if filetype == "rust" then
		-- Get all lines within the buffer
		local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

		-- true if any line contains "leptos"
		local probably_leptos_project = false
		for _, v in pairs(lines) do
			if v:match "leptos" then
				probably_leptos_project = true
				break
			end
		end

		if probably_leptos_project == true then
			vim.cmd.write() -- Write the buffer,
			-- you technically don't need to write the buffer and could instead
			-- filter your buffer using vim.cmd([[%! leptosfmt -t 2]]).
			-- It all comes down to preference.

			-- remove 'silent' if you want to see errors and all that.
			vim.cmd [[silent !leptosfmt % -t 2]] -- '%' expands to [path to current buffer]
			vim.notify("Formatted with leptosfmt!", vim.log.levels.INFO)
			return
		end
	end
	vim.lsp.buf.format()
end

vim.keymap.set("n", "<leader>fl", lsp_or_leptos)
