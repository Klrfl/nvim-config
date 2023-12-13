return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.black0 },
        }
      end,

      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.25, -- percentage of the shade to apply to the inactive window
      },
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        conditionals = { "altfont" },
      },
      integrations = {
        lsp_saga = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
} -- theme
