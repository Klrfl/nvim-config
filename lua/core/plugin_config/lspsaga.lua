local status, saga = pcall(require, "lspsaga")
if not status then
	return
end

saga.setup({
	server_filetype_map = {},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-n>", ":Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "K", ":Lspsaga hover_doc<CR>", opts)
vim.keymap.set("n", "gd", ":Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<C-k>", ":Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "<F2>", ":Lspsaga rename<CR>", opts)
