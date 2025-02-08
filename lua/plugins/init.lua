-- if you're looking for the rest of the plugins, they have their own files!
return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      background_colour = "#000000",
      max_width = 60,
      render = "wrapped-compact",
    },
  },

  --autopair and autotag for web dev
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    version = "*",
    config = true,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      lazygit = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
██╗  ██╗██╗     ██████╗ ███████╗██╗
██║ ██╔╝██║     ██╔══██╗██╔════╝██║
█████╔╝ ██║     ██████╔╝█████╗  ██║
██╔═██╗ ██║     ██╔══██╗██╔══╝  ██║
██║  ██╗███████╗██║  ██║██║     ███████╗
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝]],
        },
        headers = { "%s", align = "center" },
      },

      explorer = { enabled = true },
      picker = {
        sources = {
          explorer = {
            layout = { layout = { position = "right" } },
          },
        },
      },
    },
    keys = {
      { "<leader>g", "<cmd>lua Snacks.lazygit()<CR>", desc = "Open Lazygit" },
      { "<leader>b", "<cmd>lua Snacks.explorer()<CR>", desc = "Open Explorer" },
    },
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
}
