-- plugin notify
---@diagnostic disable: undefined-global

return {
	"rcarriga/nvim-notify",
	config = function()
		require("notify").setup({
			fps = 60,
			stages = "fade",
			render = "minimal",
			background_colour = "#1e222a",
			timeout = 1000,
			top_down = true,
			level = 3,
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		})
		vim.notify = require("notify")
	end,
}
