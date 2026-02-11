return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
          width = 0.7,
          height = 0.8,
        },
      },
    },
  },

  opts = {},

  config = function()
    -- https://www.reddit.com/r/neovim/comments/1jmsl3j/switch_to_011_now_not_showing_borders_on/
    vim.o.winborder = "rounded"

    -- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or "n"

          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP:" .. desc })
        end

        local lsp = vim.lsp
        map("gD", lsp.buf.declaration, "go to declaration")
        map("K", lsp.buf.hover, "hover")
        map("gi", lsp.buf.implementation, "peek implementation")
        map("gd", lsp.buf.definition, "go to definition")
        map("<C-k>", lsp.buf.signature_help, "get signature help")
        map("<space>D", lsp.buf.type_definition, "get type definition")
        map("gr", lsp.buf.references, "references")

        map("[d", ":Lspsaga diagnostic_jump_next<CR>", "go to next diagnostic")
        map("]d", ":Lspsaga diagnostic_jump_prev<CR>", "go to previous diagnostic")
        map("<F2>", ":Lspsaga rename<CR>", "rename symbol")
        map("<leader>ca", ":Lspsaga code_action<CR>", "open code action")
        map("<leader>o", ":Lspsaga outline<CR>", "open code outline")
      end,
    })

    -- https://github.com/vuejs/language-tools/wiki/Neovim
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

    -- ts
    vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.enable({ "vtsls", "vue_ls" })

    -- web stuff
    vim.lsp.enable({
      "html",
      "cssls",
      "emmet_language_server",
      "intelephense",
      "svelte",
      "astro",
      "tailwindcss",
    })

    -- https://github.com/neovim/neovim/issues/21686
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {
              "vim",
              "require",
            },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
        },
      },
    })

    vim.lsp.enable("lua_ls")

    -- others
    vim.lsp.enable({
      "lua_ls",
      "marksman",
      "clangd",
      "basedpyright",
    })
  end,
}
