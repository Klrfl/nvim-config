local status, conform = pcall(require, "conform")
if not status then
  return
end

conform.setup({
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
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
