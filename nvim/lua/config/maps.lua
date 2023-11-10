vim.g.mapleader = ' '

local map = vim.keymap.set

map('n', 'xx', ':w<cr>')
map('n', 'qq', ':q<cr>')
map('n', '<leader>q', ':q!<cr>')
map('i', 'jk', '<ESC>')
map('n', '<leader>so', ':so<cr>')
map('n', 'aa', ':NvimTreeToggle<cr>')
map('n', 'tt', ':ToggleTerm<cr>')
map('n', '<leader>=', ':LspZeroFormat<cr>')
map('n', '<leader>la', ':Lazy<cr>')
map('n', '<leader>ma', ':Mason<cr>')

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>d", "<C-d>")
map("n", "<leader>r", ":RunCode<CR>")
map("n", "<leader>bn", ":bn<CR>")

map("n", "de", vim.diagnostic.open_float)
map("n", "gd", vim.lsp.buf.definition)
map("n", "gh", vim.lsp.buf.hover)
