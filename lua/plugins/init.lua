-- if you're looking for the rest of the plugins, they have their own files!
return {
  { "mg979/vim-visual-multi", event = "InsertEnter" }, -- multicursor

  --autopair and autotag for web dev
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
  },
  {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
}
