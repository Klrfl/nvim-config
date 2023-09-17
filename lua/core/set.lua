vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.colorcolumn = '80'
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

