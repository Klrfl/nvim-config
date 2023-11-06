local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 }, -- theme
  "nvim-tree/nvim-tree.lua", -- file explorer
  {
    "nvim-lualine/lualine.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  }, -- status line

  "akinsho/bufferline.nvim", --tabs!!
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "mg979/vim-visual-multi" }, -- multicursor

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.2",
    -- or                            , branch = '0.1.x',
    dependencies = "nvim-lua/plenary.nvim",
  },

  -- LSP, formatter
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "stevearc/conform.nvim",
  "mfussenegger/nvim-lint",

  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "onsails/lspkind.nvim",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",
  "glepnir/lspsaga.nvim",

  --autopair and autotag for web dev
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  "windwp/nvim-ts-autotag",

  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },
  "numToStr/Comment.nvim",
  {
    "akinsho/toggleterm.nvim",
    version = "*",
  },

  "lewis6991/gitsigns.nvim",
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup()
    end,
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
  },
}, {
  ui = {
    border = "single",
  },
})
