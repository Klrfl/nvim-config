return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = "Mason",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
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
      ensure_installed = {
        "html",
        "cssls",
        "ts_ls",
        "emmet_ls",
        "tailwindcss",
        "astro",
        "volar",
        "marksman",
        "lua_ls",
      },
    })

    -- Global mappings.
    local keymap = vim.keymap
    local lsp = vim.lsp

    -- https://www.reddit.com/r/neovim/comments/1jmsl3j/switch_to_011_now_not_showing_borders_on/
    vim.o.winborder = "rounded"

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, _)
      local opts = { noremap = true, silent = true }
      keymap.set("n", "gD", lsp.buf.declaration)
      keymap.set("n", "K", lsp.buf.hover)
      keymap.set("n", "gi", lsp.buf.implementation)
      keymap.set("n", "gd", lsp.buf.definition)
      keymap.set("n", "<C-k>", lsp.buf.signature_help)
      keymap.set("n", "<space>D", lsp.buf.type_definition)
      keymap.set("n", "gr", lsp.buf.references)

      keymap.set("n", "[d", ":Lspsaga diagnostic_jump_next<CR>", opts)
      keymap.set("n", "]d", ":Lspsaga diagnostic_jump_prev<CR>", opts)
      keymap.set("n", "<F2>", ":Lspsaga rename<CR>", opts)
      keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
      keymap.set("n", "<leader>o", ":Lspsaga outline<CR>", opts)
    end

    -- Setup language servers.
    local lspconfig = require("lspconfig")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

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
        "blade",
        "php",
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

    -- https://github.com/vuejs/language-tools/
    local vue_language_server_path = vim.fn.expand("$MASON/packages")
      .. "/vue-language-server"
      .. "/node_modules/@vue/language-server"

    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }

    local vue_ls_config = {}
    local vtsls_config = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = { vue_plugin },
          },
        },
      },
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
    }

    vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.enable({ "vtsls", "vue_ls" })
  end,
}
