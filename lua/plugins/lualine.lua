return {
  "nvim-lualine/lualine.nvim",
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
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
      lualine_c = { "filename", "filetype", "selectioncount" },
      lualine_x = { "encoding", "fileformat" },
      lualine_z = {
        {
          "location",
          fmt = function(str)
            return str .. "| "
          end,
        },
      },
    },
    extensions = { "nvim-tree", "toggleterm" },
  },
} -- status line
