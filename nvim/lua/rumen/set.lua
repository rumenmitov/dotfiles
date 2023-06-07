-- General
	vim.opt.updatetime = 50
	vim.opt.scrolloff = 5
  vim.opt.laststatus = 2

-- Line numbers
	vim.opt.nu = true
	vim.opt.rnu = true

-- Indenting
	vim.opt.tabstop = 2
	vim.opt.softtabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.smartindent = true

-- Wrap
  vim.opt.wrap = true

-- Search
	vim.opt.hlsearch = true
	vim.opt.incsearch = true

-- Folding (breaks Telescope plugin)
  -- vim.opt.foldnestmax = 1
  -- vim.opt.foldcolumn = "2"
  -- vim.opt.foldmethod = "indent"

-- Version control
  -- vim.opt.undodir = "~/.vim/undodir"
  -- vim.opt.undofile = true

-- Colorscheme
  vim.opt.background = "dark"
	vim.cmd.colorscheme("nord")
	vim.opt.termguicolors = true
