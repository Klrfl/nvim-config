local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

saga.setup({
  server_filetype_map = {},
  lightbulb = {
    sign = false,
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-n>", ":Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "<leader>f", ":Lspsaga finder<CR>", opts)
vim.keymap.set("n", "<C-k>", ":Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<F2>", ":Lspsaga rename<CR>", opts)
