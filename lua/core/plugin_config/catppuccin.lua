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
    percentage = 0.10, -- percentage of the shade to apply to the inactive window
  },
  styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
    comments = { "italic" }, -- Change the style of comments
    conditionals = { "altfont" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = {
      enabled = true,
    },
    treesitter = true,
    mason = true,
    lsp_saga = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
  },
})

vim.cmd.colorscheme("catppuccin")
