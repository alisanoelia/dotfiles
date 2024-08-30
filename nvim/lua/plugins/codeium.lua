-- return {
-- 	"Exafunction/codeium.nvim",
-- 	lazy = false,
-- 	config = function()
-- 		require('codeium').setup({
-- 			enable_chat = true,
-- 		})
-- 	end
-- }

-- error plenary plugin

return {
	'Exafunction/codeium.vim',
	config = function()
		-- Change '<C-g>' here to any keycode you like.
		vim.keymap.set('i', '<C-k>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
			{ expr = true, silent = true })
		vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
			{ expr = true, silent = true })
		vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
	end
}
