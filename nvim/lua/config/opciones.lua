vim.g.mapleader = " "


-- Opciones Personales
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

-- Copiar Y Pegar

set.clipboard = "unnamedplus"

set.backup = false
set.errorbells = false
set.swapfile = false

-- Indentation
vim.opt.expandtab = true
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true






-- No Recording
vim.cmd([[
  set notimeout ttimeout ttimeoutlen=100
]])

