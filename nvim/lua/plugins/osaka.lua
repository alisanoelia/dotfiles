---@diagnostic disable: undefined-global

return {
	"craftzdog/solarized-osaka.nvim",
	lazy = true,
	enabled = false,
	priority = 1000,
	config = function()
		require("solarized-osaka").setup({
			transparent = true,
		})
		vim.cmd([[colorscheme solarized-osaka]])
	end,
}
