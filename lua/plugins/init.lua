return {
  "mg979/vim-visual-multi", -- multicursor

  --lsp stuff
  "hrsh7th/cmp-nvim-lsp",
  "L3MON4D3/LuaSnip",
  "onsails/lspkind.nvim",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  "williamboman/mason-lspconfig.nvim",

  --autopair and autotag for web dev
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

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
}
