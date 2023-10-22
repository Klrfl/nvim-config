local status, conform = pcall(require, "conform")
if not status then
  return
end

conform.setup({
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
})
