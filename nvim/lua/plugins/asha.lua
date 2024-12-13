-- config colorscheme

return {
	'alisanoelia/asha-nvim',
	lazy = true,
	config = function()
		require("asha").setup({
			background = "hard",
			transparent_background_level = 2,
			italics = true,
		})
		-- vim.g.everforest_diagnostic_line_highlight = 1
		vim.cmd [[colorscheme asha]]
	end
}
