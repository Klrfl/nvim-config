local keymap = vim.keymap

-- stolen from thePrimeAgen
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "x", '"_x')

keymap.set("n", "+", "<C-a>")
keymap.set("n", "_", "<C-x>")
keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- split windows
keymap.set("n", "ss", ":split<CR><C-w>w", { silent = true })
keymap.set("n", "sv", ":vsplit<CR><C-w>w", { silent = true })

-- resize window
keymap.set("n", "<C-w><left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-w><right>", ":vertical resize +2<CR>")
keymap.set("n", "<C-w><up>", ":resize +2<CR>")
keymap.set("n", "<C-w><down>", ":resize -2<CR>")

-- tabs
local tabopts = { silent = true }
keymap.set("n", "te", ":tabedit<CR>", tabopts)
keymap.set("n", "tx", ":tabclose<CR>", tabopts)
keymap.set("n", "th", ":tabprevious<CR>", tabopts)
keymap.set("n", "tl", ":tabnext<CR>", tabopts)

-- fast navigation
keymap.set("n", "<down>", "}")
keymap.set("n", "<up>", "{")

keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("n", "<C-z>", ":lua require('notify')('Bruh did you mean to press u?', 'info')<CR>", { silent = true })
