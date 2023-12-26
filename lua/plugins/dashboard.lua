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
      -- return random verses
      footer = function()
        Verses = {
          {
            "",
            "",
            "Aku mengucap syukur kepada Allahku setiap kali aku mengingat kamu.",
            "Filipi 1:3",
          },
          {
            "",
            "",
            "Apa pun juga yang kamu perbuat, perbuatlah dengan segenap hatimu seperti untuk Tuhan",
            "dan bukan untuk manusia.",
            "Kolose 3:23",
          },
          {
            "",
            "",
            "Sebab Aku ini mengetahui rancangan-rancangan apa yang ada pada-Ku mengenai kamu,",
            "demikianlah firman Tuhan, yaitu rancangan damai sejahtera dan bukan rancangan kecelakaan,",
            "untuk memberikan kepadamu hari depan yang penuh harapan.",
            "Yeremia 29:11",
          },
          {
            "",
            "",
            "Sebab kami tidak memperhatikan yang kelihatan, melainkan yang tak kelihatan,",
            "karena yang kelihatan adalah sementara, sedangkan yang tak kelihatan adalah kekal.",
            "2 Korintus 4:18",
          },
          {
            "",
            "",
            "Janganlah hatimu iri kepada orang-orang yang berdosa, tetapi takutlah akan Tuhan senantiasa. Karena",
            "masa depan sungguh ada, dan harapanmu tidak akan hilang.",
            "mazmur 3:17-18",
          },
          {
            "",
            "",
            "Bersukacitalah dalam pengharapan, sabarlah dalam kesesakan, dan bertekunlah dalam doa!",
            "Bantulah dalam kekurangan orang-orang kudus dan usahakanlah dirimu untuk selalu memberikan tumpangan!",
            "Roma 12:12-13",
          },
        }
        math.randomseed(os.time())
        return Verses[math.random(#Verses)]
      end,
    },
    hide = {
      statusline = false,
    },
  },
}
