return {
  -- completion and lsp stuff
  "hrsh7th/nvim-cmp",
  event = "BufEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "onsails/lspkind.nvim",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-cmdline",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")
    require("luasnip.loaders.from_vscode").lazy_load()

    -- https://github.com/dpetka2001/dotfiles/blob/10d02517395783adb31bffab5447437b8f908e15/dot_config/nvim/lua/plugins/coding.lua#L47-L62
    -- from a post in r/neovim - thanks!
    local types = require("cmp.types")
    local function deprioritize_snippets(entry1, entry2)
      if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return false
      end

      if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
        return true
      end
    end

    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),

      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },

      -- sort snippets
      sorting = {
        comparators = {
          deprioritize_snippets,
          cmp.config.compare.locality,
          cmp.config.compare.recently_used,
          cmp.config.compare.score,
          cmp.config.compare.offset,
          cmp.config.compare.order,
        },
      },

      window = {
        documentation = { border = "rounded" },
        completion = { border = "rounded" },
      },

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 60, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        }),
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })
  end,
}
