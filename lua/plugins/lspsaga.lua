return {
  "glepnir/lspsaga.nvim",
  event = "BufEnter",
  config = function()
    local saga = require("lspsaga")

    saga.setup({
      server_filetype_map = {},
      code_action = {
        extend_gitsigns = true,
      },
      lightbulb = {
        sign = false,
      },
    })

    local keymap = vim.keymap

    local opts = { noremap = true, silent = true }
    keymap.set("n", "<C-n>", ":Lspsaga diagnostic_jump_next<CR>", opts)
    keymap.set("n", "<C-p>", ":Lspsaga diagnostic_jump_prev<CR>", opts)
    keymap.set("n", "<F2>", ":Lspsaga rename<CR>", opts)
    keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", opts)
    keymap.set("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
  end,
}
