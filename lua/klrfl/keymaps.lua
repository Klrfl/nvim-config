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

-- windows
keymap.set("", "s<left>", "<C-w>h")
keymap.set("", "s<down>", "<C-w>j")
keymap.set("", "s<up>", "<C-w>k")
keymap.set("", "s<right>", "<C-w>l")

-- resize window
keymap.set("n", "<C-w><left>", ":vertical resize -2<CR>")
keymap.set("n", "<C-w><right>", ":vertical resize +2<CR>")
keymap.set("n", "<C-w><up>", ":resize -2<CR>")
keymap.set("n", "<C-w><down>", ":resize +2<CR>")

-- fast navigation
keymap.set("n", "<down>", "}")
keymap.set("n", "<up>", "{")

keymap.set("n", "<C-a>", "ggVG")
keymap.set("n", "<C-s>", ":w<CR>")
keymap.set("n", "<C-z>", ":lua print('bruh did you mean to press u?')<CR>")
