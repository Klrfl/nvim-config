local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { "catppuccin/nvim", as = "catppuccin" } -- theme
  use 'nvim-tree/nvim-tree.lua'                -- file explorer
  use {
    'nvim-lualine/lualine.nvim',               -- status line
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use 'akinsho/bufferline.nvim' --tabs!!
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'mg979/vim-visual-multi' -- multicursor

  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- LSP, formatter
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    'jose-elias-alvarez/null-ls.nvim',
    'MunifTanjim/prettier.nvim'
  }

  -- completion
  use {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'onsails/lspkind.nvim',
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets",
    "glepnir/lspsaga.nvim",
  }

  --autopair and autotag for web dev
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use 'windwp/nvim-ts-autotag'

  use {
    'numToStr/Comment.nvim',
    config = function()
     require("Comment").setup()
    end
  }

  -- git highlighting
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup()
    end
  }
  use {
    "akinsho/toggleterm.nvim",
    tag = '*'
  }
  -- Atomatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
