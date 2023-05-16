--- General
	vim.opt.updatetime = 50
	vim.opt.scrolloff = 5
  vim.opt.laststatus = 2

--- Line numbers
	vim.opt.nu = true
	vim.opt.rnu = true

--- Indenting
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.smartindent = true

--- Search
	vim.opt.hlsearch = true
	vim.opt.incsearch = true

--- Folding
  vim.opt.foldnestmax = 1
  vim.opt.foldcolumn = "2"
  vim.opt.foldmethod = "indent"

--- Colorscheme
	vim.cmd.colorscheme("everforest")
	vim.opt.termguicolors = true


