local opt = vim.opt
local bo = vim.bo

opt.number = true
opt.relativenumber = true

showmode = true

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.clipboard = 'unnamedplus'

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = false

opt.ignorecase = true
opt.smartcase = true
opt.hidden = true
opt.ignorecase = true
opt.hlsearch = false
opt.incsearch = true

opt.swapfile = false
opt.autoread = true

opt.cursorline = true

opt.smartindent = true

opt.wrap = false
opt.signcolumn = 'yes'

opt.path:append { '**' }

opt.showmode = false

opt.termguicolors = true

opt.list = false

-- opt.foldmethod = "indent"
-- vim.wo.foldlevel = 1
-- vim.wo.foldminlines= 2
