return require('packer').startup(function(use)
  -- Pack manager
  use 'wbthomason/packer.nvim'

 -- Dashboard
 use {
   'goolord/alpha-nvim',
   requires = { 'nvim-tree/nvim-web-devicons' },
 }

 -- File manager
 use 'prichrd/netrw.nvim' 

 -- Fuzzy finder
 use {
   'nvim-telescope/telescope.nvim', tag = '0.1.x',
   requires = { {'nvim-lua/plenary.nvim'} }
 }

 -- Icons
 use 'nvim-tree/nvim-web-devicons'

 -- Colorscheme
 use 'sainnhe/everforest'
 use 'shaunsingh/nord.nvim'
 use 'navarasu/onedark.nvim'
 use 'Mofiqul/dracula.nvim'
 use 'morhetz/gruvbox'

 -- Version control
 use 'mbbill/undotree' 

 -- Statusline
 use {
   'nvim-lualine/lualine.nvim',
   requires = { 'nvim-tree/nvim-web-devicons', opt = true }
 }

 -- Notifications
 use 'rcarriga/nvim-notify'

 -- Zen mode
 use "folke/zen-mode.nvim"

 -- Smooth scroll
 use 'karb94/neoscroll.nvim'

 -- Syntax highlighting
 use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

 -- Context
 -- must be loaded after treesitter
 use 'romgrk/nvim-treesitter-context' 

 -- Autocompletion
 use {
   'VonHeikemen/lsp-zero.nvim',
   branch = 'v2.x',
   requires = {
     -- LSP Support
     {'neovim/nvim-lspconfig'},             -- Required
     {                                      -- Optional
       'williamboman/mason.nvim',
       run = function()
         pcall(vim.cmd, 'MasonUpdate')
       end,
     },
     {'williamboman/mason-lspconfig.nvim'}, -- Optional
     {'hrsh7th/nvim-cmp'},     -- Required
     {'hrsh7th/cmp-nvim-lsp'}, -- Required
     {'L3MON4D3/LuaSnip'},     -- Required
   }
 }
 
 -- Yuck autocomplete
 use 'elkowar/yuck.vim'

 -- Comments
 use 'tpope/vim-commentary'

 -- Formatter for S-expressions
 use({
   'eraserhd/parinfer-rust', 
   run = 'cargo build --release'
 })

 -- Git
 use {
   'airblade/vim-gitgutter',
   branch = "main"
 }

 -- HTML boilerplate
 use 'mattn/emmet-vim'

 -- Color Preview
 use 'brenoprata10/nvim-highlight-colors'

 -- Autopairs
 use "windwp/nvim-autopairs"

 -- Vim surround
 use 'tpope/vim-surround'

 -- Markdown preview
 use({
   "iamcco/markdown-preview.nvim",
   run = function() vim.fn["mkdp#util#install"]() end,
 })

  -- Better comments
  -- use({
  --     "folke/todo-comments.nvim",
  --     requires = { "nvim-lua/plenary.nvim", opts = {} }
  -- })
    use "Djancyp/better-comments.nvim"

  end)
