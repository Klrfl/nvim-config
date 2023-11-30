return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = {
    theme = "doom",
    config = {
      header = {
        [[                                        ]],
        [[                                        ]],
        [[██╗  ██╗██╗     ██████╗ ███████╗██╗     ]],
        [[██║ ██╔╝██║     ██╔══██╗██╔════╝██║     ]],
        [[█████╔╝ ██║     ██████╔╝█████╗  ██║     ]],
        [[██╔═██╗ ██║     ██╔══██╗██╔══╝  ██║     ]],
        [[██║  ██╗███████╗██║  ██║██║     ███████╗]],
        [[╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝]],
        [[                                        ]],
        [[                                        ]],
      },
      center = {
        {
          icon = " ",
          desc = "Open file tree",
          key = "<leader>b",
          action = "NvimTreeToggle",
        },
        {
          icon = " ",
          desc = "Find File",
          key = "<leader>ff",
          action = "Telescope find_files",
        },
        {
          icon = " ",
          desc = "Live grep",
          key = "<leader>fg",
          action = "Telescope live_grep",
        },
        {
          icon = " ",
          desc = "See plugins",
          key = ":Lazy",
          action = "Lazy",
        },
        {
          icon = " ",
          desc = "Configure Neovim",
          action = "edit init.lua",
        },
        {
          icon = " ",
          desc = "Quit Neovim",
          key = ":qa",
          action = "qa",
        },
      },
      footer = {
        "",
        "",
        "Aku mengucap syukur kepada Allahku setiap kali aku mengingat kamu.",
        "Filipi 1:3",
      },
    },
  },
}
