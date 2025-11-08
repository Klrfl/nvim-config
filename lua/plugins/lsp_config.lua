return {
  "williamboman/mason-lspconfig.nvim",
  event = { "BufReadPre", "BufNewFile" },
  cmd = "Mason",
  dependencies = {
    "neovim/nvim-lspconfig",
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

  opts = {
    ensure_installed = {
      "html",
      "cssls",
      "vtsls",
      "emmet_language_server",
      "tailwindcss",
      "astro",
      "vue_ls",
      "marksman",
      "lua_ls",
      "basedpyright",
    },
  },

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

    -- special server with special config
    vim.lsp.config("emmet_language_server", {
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

    vim.lsp.enable("emmet_language_server")
    vim.lsp.enable("astro")
    vim.lsp.enable("intelephense")
    vim.lsp.enable("clangd")
    vim.lsp.enable("tailwindcss")
  end,
}
