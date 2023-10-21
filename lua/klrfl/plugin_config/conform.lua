require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },

    formatters = {
      astro_fmt = {
        command = "prettier",
        args = { "." },
      },
    },

    -- Use a sub-list to run only the first available formatter
    html = { "prettier" },
    css = { "prettier" },
    vue = { "prettier" },
    astro = { "astro_fmt" },
    javascript = { "prettier" },
    json = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
