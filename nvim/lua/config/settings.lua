local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.termguicolors = true

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
opt.autoread = false

opt.cursorline = true

opt.smartindent = true

opt.wrap = false
opt.signcolumn = 'yes'

opt.path:append { '**' }

opt.showmode = false

-- opt.guicursor = ""
vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")
