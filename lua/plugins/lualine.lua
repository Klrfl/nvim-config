return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "catppuccin",
      },

      sections = {
        lualine_c = { "filename", "selectioncount" },
        lualine_x = { "fileformat", "filetype" },
      },
    })
  end,
} -- status line
