vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.relativenumber = true
vim.opt.nu = true
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.fileformat = "unix"
vim.opt.updatetime = 300
vim.opt.pumheight = 12
vim.opt.laststatus = 3
vim.opt.showmode = false

vim.cmd [[autocmd CmdlineEnter /,? :set hlsearch]]
vim.cmd "autocmd CmdlineLeave /,? :set nohlsearch"
