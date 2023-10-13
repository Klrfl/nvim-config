require("toggleterm").setup({
  shade_terminals = true,
})

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[:wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[:wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[:wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[:wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.keymap.set("n", "<C-J>", ":ToggleTerm<CR>")

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
