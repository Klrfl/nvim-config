-- from https://github.com/scottmckendry/windots/blob/main/nvim/lua/plugins/alpha.lua
return {
  "goolord/alpha-nvim",
  lazy = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
██╗  ██╗██╗     ██████╗ ███████╗██╗
██║ ██╔╝██║     ██╔══██╗██╔════╝██║
█████╔╝ ██║     ██████╔╝█████╗  ██║
██╔═██╗ ██║     ██╔══██╗██╔══╝  ██║
██║  ██╗███████╗██║  ██║██║     ███████╗
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚══════╝
]]

    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("<leader>ff", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("<leader>fg", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("<leader>b", " " .. " Explore", ":NvimTreeToggle<CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("qa", " " .. " Quit", ":qa<CR>"),
    }

    -- set highlight
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 10
    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local version = "󰥱 v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
        local plugins = "⚡ loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        --[[         local verses = {
          "Aku mengucap syukur kepada Allahku setiap kali aku mengingat kamu.\n" .. "Filipi 1:3",

          "Apa pun juga yang kamu perbuat, perbuatlah dengan segenap hatimu\n"
            .. "seperti untuk Tuhan dan bukan untuk manusia.\n"
            .. "Kolose 3:23",

          "Sebab Aku ini mengetahui rancangan-rancangan apa yang ada pada-Ku\n"
            .. "mengenai kamu demikianlah firman Tuhan, yaitu rancangan damai\n"
            .. "sejahtera dan bukan rancangan kecelakaan,\n"
            .. "untuk memberikan kepadamu hari depan yang penuh harapan.\n"
            .. "Yeremia 29:11",

          "Sebab kami tidak memperhatikan yang kelihatan, melainkan yang tak\n"
            .. "kelihatan arena yang kelihatan adalah sementara, sedangkan\n"
            .. "yang tak kelihatan adalah kekal.\n"
            .. "2 Korintus 4:18",

          "Janganlah hatimu iri kepada orang-orang yang berdosa,\n"
            .. "tetapi takutlah akan Tuhan senantiasa. Karena\n"
            .. "masa depan sungguh ada, dan harapanmu tidak akan hilang.\n"
            .. "mazmur 3:17-18",

          "Bersukacitalah dalam pengharapan, sabarlah dalam kesesakan,\n"
            .. "dan bertekunlah dalam doa!\n"
            .. "Bantulah dalam kekurangan orang-orang kudus dan usahakanlah\n"
            .. "dirimu untuk selalu memberikan tumpangan!\n"
            .. "Roma 12:12-13",
        }
 ]]
        -- math.randomseed(os.time())
        -- local randomVerse = verses[math.random(#verses)]

        -- local footer = "\t\t\t\t" .. version .. "\t\t\t\t\t" .. plugins .. "\n\n" .. "\n\n" .. randomVerse
        local footer = "\t" .. version .. "\t" .. plugins .. "\n\n" .. "\n\n"
        dashboard.section.footer.val = footer
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
