return require('packer').startup(function(use)
  --- Pack manager
  use 'wbthomason/packer.nvim'

  --- Fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --- Icons
  use 'nvim-tree/nvim-web-devicons'

  --- Colorscheme
  use 'sainnhe/everforest'

  --- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  --- Tabline
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

  --- Notifications
  use 'rcarriga/nvim-notify'

  --- Zen mode
  use "folke/zen-mode.nvim"

  --- Smooth scroll
  use 'karb94/neoscroll.nvim'

  --- Syntax highlighting
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  --- Version manager
  use('mbbill/undotree')

  --- Autocompletion
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

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  --- Comments
  use('tpope/vim-commentary')

  --- Git
  use('airblade/vim-gitgutter')

  --- HTML boilerplate
  use('mattn/emmet-vim')

  --- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
end)
