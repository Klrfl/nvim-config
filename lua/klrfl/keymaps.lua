local keymap = vim.keymap

-- stolen from thePrimeAgen
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "x", '"_x')

keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")
keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- split windows
keymap.set("n", "ss", ":split<CR>", { silent = true })
keymap.set("n", "sv", ":vsplit<CR>", { silent = true })

-- resize window
keymap.set("n", "<C-w><left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-w><right>", ":vertical resize +2<CR>")
keymap.set("n", "<C-w><up>", ":resize +2<CR>")
keymap.set("n", "<C-w><down>", ":resize -2<CR>")

-- tabs
local tabopts = { silent = true }
keymap.set("n", "te", ":tabedit<CR>", tabopts)
keymap.set("n", "tx", ":tabclose<CR>", tabopts)

keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("n", "<C-z>", ":lua require('notify')('Bruh did you mean to press u?', 'info')<CR>", { silent = true })

-- Better paste behavior
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
