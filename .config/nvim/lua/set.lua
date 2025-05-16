-- General
vim.opt.updatetime = 50
vim.opt.scrolloff = 5
vim.opt.laststatus = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.winborder = "rounded"

-- Line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- Indenting
vim.opt.tabstop = 2      -- display tab as 2 spaces
vim.opt.softtabstop = 2  -- tab = 2 spaces
vim.opt.shiftwidth = 2   -- autoindent 2 spaces
vim.opt.expandtab = true -- spaces, no tabs
vim.opt.smartindent = true

-- Wrap
vim.opt.wrap = true
vim.opt.colorcolumn = "80"

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Version control
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/rumen/.vim/undodir"
vim.opt.undofile = true

-- Colorscheme
vim.opt.background = "dark"
vim.opt.termguicolors = true

if (os.getenv("SERVER") == nil) then
    vim.cmd.colorscheme("everforest")
end
