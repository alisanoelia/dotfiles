-- config colorscheme
-- new colorscheme is available

return {
	'alisanoelia/asha-nvim',
	enabled = false,
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
