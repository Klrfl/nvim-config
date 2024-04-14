vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt
opt.number = true
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true

opt.colorcolumn = "80"
opt.termguicolors = true
opt.backspace = "2"
opt.showcmd = true
opt.scrolloff = 10
opt.laststatus = 2
opt.autowrite = true
opt.cursorline = true
opt.autoread = true

vim.opt.clipboard = "unnamedplus"

opt.wrap = false

-- spaces for tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.smarttab = true
opt.autoindent = true
opt.smartindent = true
opt.expandtab = true
