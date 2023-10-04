local null_ls = require("null-ls")

local group = vim.api.nvim_create_augroup("LspFormatting", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    -- format on save
    vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
    vim.api.nvim_create_autocmd(event, {
      callback = function()
        vim.lsp.buf.format({
          async = true,
          filter = function(c)
            return c.name == "null-ls"
          end
        })
      end,
      desc = "[lsp] format on save",
    })
  end
end

local sources = {
  null_ls.builtins.formatting.prettier.with({
    extra_filetypes = { "astro" },
  }),

  null_ls.builtins.formatting.prettier,
  null_ls.builtins.diagnostics.eslint_d,
}

null_ls.setup({
  on_attach = on_attach,
  sources = sources
})
