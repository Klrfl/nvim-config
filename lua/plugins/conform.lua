return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      json = { "prettierd" },

      html = { "prettierd" },
      css = { "prettierd" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      vue = { "prettierd" },
      astro = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      markdown = { "prettierd" },
    },

    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
  },
}
