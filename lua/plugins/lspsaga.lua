return {
  "nvimdev/lspsaga.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    server_filetype_map = {},
    code_action = {
      extend_gitsigns = true,
    },
    lightbulb = {
      sign = false,
    },
    rename = {
      keys = {
        quit = "q",
      },
    },
  },

  -- for the keybindings, see lsp_config.lua
}
