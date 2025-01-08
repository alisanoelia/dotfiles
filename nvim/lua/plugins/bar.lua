return {
	"utilyre/barbecue.nvim",
	enabled = false,
	prioity = 5000,
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("barbecue").setup()
	end,
}
