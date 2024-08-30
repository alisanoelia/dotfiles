return {
	"utilyre/barbecue.nvim",
	lazy = true,
	prioity = 5000,
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("barbecue").setup()
	end
}
