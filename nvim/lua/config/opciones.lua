vim.g.mapleader = " "

local set = vim.o

set.number = true
set.relativenumber = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.showmatch = true
set.hidden = true
set.cursorline = true
set.syntax = true
set.wrap = false
set.signcolumn = 'yes'
set.ttimeout = 0
set.ttimeoutlen = 0
set.hlsearch = false
set.termguicolors = true
set.showmode = false
vim.opt.path:append { '**' }

set.clipboard = "unnamedplus"

set.backup = false
set.errorbells = false
set.swapfile = false

set.expandtab = true
set.softtabstop = 2
set.shiftwidth = 2
set.smartindent = true
