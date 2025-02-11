return {
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
  },
}
