return {
	"akinsho/toggleterm.nvim",
	event = "VeryLazy",
	lazy = true,
	config = function()
		require("toggleterm").setup({
			-- direction = 'float'
			direction = "horizontal",
		})
	end,
}
