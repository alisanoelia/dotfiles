---@diagnostic disable: undefined-global

return {
	"sainnhe/everforest",
	enabled = false,
	priority = 1000,
	config = function()
		vim.g.everforest_transparent_background = 2
		vim.g.everforest_diagnostic_line_highlight = 1
		vim.g.everforest_better_performance = 1
		vim.g.everforest_background = "hard"
		vim.cmd([[colorscheme everforest]])
	end,
}
