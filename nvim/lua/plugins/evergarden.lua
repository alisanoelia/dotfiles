--evergarden color scheme
---@diagnostic disable: undefined-global

return {
	"comfysage/evergarden",
	priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
	enabled = false,
	config = function()
		require("evergarden").setup({
			transparent_background = true,
			variant = "medium", -- 'hard'|'medium'|'soft'
		})
		vim.cmd([[colorscheme evergarden]])
	end,
}
