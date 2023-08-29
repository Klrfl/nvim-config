require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "html", "cssls", "astro", "volar", "tsserver"}
})

-- Setup language servers.
local lspconfig = require('lspconfig')

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, _)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
  vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"}
      }
    }
  }
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function() return vim.loop.cwd() end
  -- run lsp for javascript in any directory
}

lspconfig.astro.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.volar.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
