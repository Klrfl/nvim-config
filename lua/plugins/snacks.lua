return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    scroll = {
      animate = {
        duration = { step = 10, total = 250 },
        easing = "linear",
      },

      animate_repeats = {
        duration = { step = 5, total = 50 },
        easing = "quad",
      },
    },

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
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝
                                        
]],
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
    { "<leader>z", "<cmd>lua Snacks.zen()<CR>", desc = "Toggle Zen mode" },
  },
}
