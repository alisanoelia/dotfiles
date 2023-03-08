-- Mis atajos
local map = vim.keymap.set

map ('n', 'xx', ':w<CR>')
map ("n", "qq", ":q<CR>")
map ("n", "ff", ":Explore<CR>")
map ("n", "rr", ":so<CR>")
map ("n", "mm", ":Mason<CR>")
map ("i", "jk", "<ESC>")
map ("n", "aa", ":NeoTreeReveal<CR>")
map ("n", "tt", ":ToggleTerm<CR>")
map ("t", "wq", "exit<CR>")
map ("n", "<leader>h", "<C-w>h")
map ("n", "<leader>l", "<C-w>l")
map ("n", "<leader>k", "<C-w>k")
map ("n", "<leader>d", "<C-d>")
