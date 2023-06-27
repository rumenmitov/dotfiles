return require('packer').startup(function(use)
  -- Pack manager
  use 'wbthomason/packer.nvim'

  -- Dashboard
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- Fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

  -- Colorscheme
  use 'sainnhe/everforest'
  use 'shaunsingh/nord.nvim'
  use {
    'navarasu/onedark.nvim',
    config = function() 
      require('onedark').setup {
        style = 'warm'
      }
    end 
  }
  use 'Mofiqul/dracula.nvim'
  use 'morhetz/gruvbox'

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

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
    }
  }

  -- Comments
  use('tpope/vim-commentary')

  -- Git
  use {
    'airblade/vim-gitgutter',
    branch = "main"
  }

  -- HTML boilerplate
  use('mattn/emmet-vim')

  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

end)
