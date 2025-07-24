-- completion and lsp stuff

return {
  "Saghen/blink.cmp",
  version = "1.*",
  dependencies = {
    "onsails/lspkind.nvim",

    "xzbdmw/colorful-menu.nvim",
  },
  event = "VeryLazy",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        cmdline = {
          enabled = function()
            -- ignores cmdline completions when executing shell commands
            local is_not_command_mode = vim.fn.getcmdtype() ~= ":"
            local is_shell_command = vim.fn.getcmdline():match("^[%%0-9,'<>%-]*!")
            return is_not_command_mode or not is_shell_command
          end,
        },
      },
    },
    keymap = { preset = "super-tab" },
    fuzzy = { implementation = "lua" },
    cmdline = {
      keymap = {
        ["<Tab>"] = { "show", "accept" },
      },
      completion = { menu = { auto_show = true } },
    },

    completion = {
      documentation = { window = { border = "single" } },

      -- nvim-cmp style completion menu
      menu = {
        border = "rounded",
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", gap = 1, "kind" },
          },

          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
    },
    signature = { window = { border = "rounded" } },
  },
}
