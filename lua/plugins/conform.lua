return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      astro_fmt = {
        command = "prettier",
        args = { "--plugin", "prettier-plugin-astro", "$FILENAME" },
      },
    },

    formatters_by_ft = {
      lua = { "stylua" },
      json = { "prettier" },

      html = { "prettier" },
      css = { "prettier" },
      javascript = { "prettier" },
      vue = { "prettier" },
      astro = { "astro_fmt" },
      ["_"] = { "prettier" },
    },

    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
