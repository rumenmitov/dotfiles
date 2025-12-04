-- General
vim.opt.updatetime  = 50
vim.opt.scrolloff   = 5
vim.opt.laststatus  = 2
vim.opt.splitright  = true
vim.opt.splitbelow  = true
vim.opt.winborder   = "rounded"
vim.opt.fillchars   = { eob = " " }

-- Window Properties
local focused_area   = 7 / 10 -- desired area that the focused window holds
local max_windows    = 4      -- max amount of splits allowes
vim.opt.winwidth     = math.floor(focused_area * vim.o.columns)
vim.opt.winminwidth  = math.floor(vim.o.columns / (max_windows + 1))
vim.opt.winheight    = math.floor(focused_area * vim.o.lines)
vim.opt.winminheight = math.floor(vim.o.lines / (max_windows + 1))

-- Line numbers
vim.opt.nu  = true
vim.opt.rnu = true

-- Indenting
vim.opt.tabstop     = 2       -- display tab as 2 spaces
vim.opt.softtabstop = 2       -- tab = 2 spaces
vim.opt.shiftwidth  = 2       -- autoindent 2 spaces
vim.opt.expandtab   = true    -- spaces, no tabs
vim.opt.smartindent = true

-- Wrap
vim.opt.wrap        = true
vim.opt.colorcolumn = "80"

-- Search
vim.opt.hlsearch  = false
vim.opt.incsearch = true

-- Wildmenu
vim.opt.wildmode = "longest:full"

-- Version control
vim.opt.swapfile  = false
vim.opt.backup    = false
vim.opt.undodir   = "/home/rumen/.vim/undodir"
vim.opt.undofile  = true

-- Colorscheme
vim.opt.background    = "dark"
vim.opt.termguicolors = true

if vim.version.gt(vim.version(), {0, 10, 0}) then
    vim.cmd.colorscheme("default")
end
