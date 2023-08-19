local opt = vim.opt
local bo = vim.bo

opt.number = true
opt.relativenumber = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.clipboard = "unnamedplus"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true
opt.hidden = true
opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true

opt.swapfile = false
opt.autoread = true
bo.autoread = true

opt.cursorline = true

opt.wrap = false
opt.signcolumn = 'yes'

opt.path:append { '**' }

opt.showmode = false

opt.termguicolors = true
