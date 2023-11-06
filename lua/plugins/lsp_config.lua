return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "html", "cssls", "astro", "volar", "tsserver" },
    })

    -- Global mappings.
    local keymap = vim.keymap
    local lsp = vim.lsp

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    keymap.set("n", "<space>e", vim.diagnostic.open_float)
    keymap.set("n", "[d", vim.diagnostic.goto_prev)
    keymap.set("n", "]d", vim.diagnostic.goto_next)
    keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    -- nice border for hovering. thanks to https://www.reddit.com/r/neovim/comments/wscfar/how_to_get_bordered_ui_for_hover_actions_in/
    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })
    lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, _)
      keymap.set("n", "gD", lsp.buf.declaration)
      keymap.set("n", "gd", lsp.buf.definition)
      keymap.set("n", "K", lsp.buf.hover)
      keymap.set("n", "gi", lsp.buf.implementation)
      keymap.set("n", "<C-k>", lsp.buf.signature_help)
      keymap.set("n", "<space>D", lsp.buf.type_definition)
      keymap.set("n", "gr", lsp.buf.references)
    end

    -- Setup language servers.
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    lspconfig.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.astro.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.volar.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
