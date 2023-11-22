return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      icons_enabled = true,
      theme = "catppuccin",
    },

    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str .. "!!!!"
          end,
        },
      },
      lualine_c = { "filename", "selectioncount" },
      lualine_x = { "fileformat", "filetype" },
      lualine_z = {
        {
          "location",
          fmt = function(str)
            return str .. "| "
          end,
        },
      },
    },
  },
} -- status line
