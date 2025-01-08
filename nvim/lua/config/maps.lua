-- my keymaps
---@diagnostic disable: undefined-global

local map = vim.keymap.set
vim.g.mapleader = " "

map("i", "<ESC>", "<ESC>")
map("i", "jk", "<ESC>")
map("n", "qq", ":q! <cr>")
map("n", "xx", ":w! <cr>")
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")
map("n", "aa", ":NvimTreeToggle <cr>")
map("n", "<leader>r", ":RunCode<cr>")
map("n", "tt", ":ToggleTerm <cr>")
map("n", "<leader>bn", ":bn<cr>")
map("n", "<leader>la", ":Lazy<cr>")
map("n", "L", "%")

-- copy error lsp float
map("n", "<leader>ce", [[:lua YankDiagnosticError()<CR>]], { noremap = true, silent = true })

function YankDiagnosticError()
	vim.diagnostic.open_float()
	local win_id = vim.fn.win_getid() -- get the window ID of the floating window
	vim.cmd("normal! j") -- move down one row
	vim.cmd("normal! VG") -- select everything from that row down
	vim.cmd("normal! y") -- yank selected text
	vim.api.nvim_win_close(win_id, true) -- close the floating window by its ID
end
