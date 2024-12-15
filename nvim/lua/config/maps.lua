local map = vim.keymap.set
vim.g.mapleader = " "

map('i', '<ESC>', '<ESC>')
map('i', 'jk', '<ESC>')
map('n', 'qq', ':q! <cr>')
map('n', 'xx', ':w! <cr>')
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "aa", ":NvimTreeToggle <cr>")
map("n", "<leader>r", ":RunCode<cr>")
map("n", "tt", ":ToggleTerm <cr>")
map("n", "<leader>bn", ":bn<cr>")
map("n", "<leader>la", ":Lazy<cr>")
