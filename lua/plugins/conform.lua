return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "prettier" },

      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      vue = { "prettier" },
      astro = { "prettier" },
    },

    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
