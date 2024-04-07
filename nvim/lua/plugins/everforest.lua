-- config colorscheme

return {
	'neanias/everforest-nvim',
	config = function()
		require("everforest").setup({
			background = "hard",
			transparent_background_level = 2,
		})
		vim.g.everforest_diagnostic_line_highlight = 1
		vim.cmd [[colorscheme everforest]]
	end,
}
