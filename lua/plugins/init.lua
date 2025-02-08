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
    "declancm/cinnamon.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        basic = true,
        extra = true,
      },
      options = {
        delay = 1,
        step_size = {
          -- Number of cursor/window lines moved per step
          vertical = 3,
          -- Number of cursor/window columns moved per step
          horizontal = 2,
        },
      },
    },
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
    },
    keys = {
      { "<leader>g", "<cmd>lua Snacks.lazygit()<CR>", desc = "Open Lazygit" },
    },
  },
  {
    "ThePrimeagen/vim-be-good",
    cmd = "VimBeGood",
  },
}
