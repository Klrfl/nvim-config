return {
  "williamboman/mason.nvim",
  event = "BufEnter",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "rounded",
        width = 0.7,
        height = 0.8,
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "html", "cssls", "tsserver", "astro", "volar", "emmet_ls", "tailwindcss" },
    })

    -- Global mappings.
    local keymap = vim.keymap
    local lsp = vim.lsp

    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    keymap.set("n", "<space>e", vim.diagnostic.open_float)
    keymap.set("n", "<space>q", vim.diagnostic.setloclist)

    local hover_opts = {
      border = "rounded",
      max_width = 80,
    }

    -- nice border for hovering. thanks to https://www.reddit.com/r/neovim/comments/wscfar/how_to_get_bordered_ui_for_hover_actions_in/
    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, hover_opts)
    lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, hover_opts)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, _)
      keymap.set("n", "gD", lsp.buf.declaration)
      keymap.set("n", "K", lsp.buf.hover)
      keymap.set("n", "gi", lsp.buf.implementation)
      keymap.set("n", "gd", lsp.buf.definition)
      keymap.set("n", "<C-k>", lsp.buf.signature_help)
      keymap.set("n", "<space>D", lsp.buf.type_definition)
      keymap.set("n", "gr", lsp.buf.references)
    end

    -- Setup language servers.
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- special server with special config
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

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "html",
        "css",
        "sass",
        "scss",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "astro",
      },
      init_options = {
        html = {
          options = {
            -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
            ["bem.enabled"] = true,
          },
        },
      },
    })

    local servers = { "html", "cssls", "tsserver", "astro", "volar", "tailwindcss" }

    for _, server in pairs(servers) do
      lspconfig[server].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end
  end,
}
