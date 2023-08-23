vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt
opt.number = true
opt.relativenumber = true

vim.wo.colorcolumn = '80'
vim.o.background = 'dark'
opt.termguicolors = true
opt.backspace = '2'
opt.showcmd = true
opt.scrolloff = 10
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true
opt.clipboard:append { 'unnamedplus' }
opt.wrap = false

-- spaces for tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true

local keymap = vim.keymap

keymap.set('n', '<leader>h', ':nohlsearch<CR>')

keymap.set('n', 'te', ':tabedit<CR>')

-- split windows
keymap.set('n', 'ss', ':split<CR><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<CR><C-w>w', { silent = true })

-- windows
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 's<left>', '<C-w>h')
keymap.set('', 's<down>', '<C-w>j')
keymap.set('', 's<up>', '<C-w>k')
keymap.set('', 's<right>', '<C-w>l')

-- resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- fast navigation
keymap.set("n", "<down>", "}")
keymap.set("n", "<up>", "{")

keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set('n', '<C-s>', ':w<CR>')
