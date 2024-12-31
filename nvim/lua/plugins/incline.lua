---@diagnostic disable: undefined-global

return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	config = function()
		require("incline").setup({
			highlight = {
				groups = {
					InclineNormal = { guibg = "#d8a657", guifg = "#1a1a1a", gui = "bold" },
					InclineNormalNC = { guifg = "#d8a657", guibg = "#1a1a1a", gui = "bold" },
				},
			},
		})
	end,
}
