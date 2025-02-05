return {
	"folke/snacks.nvim",
	config = function()
		require("snacks").setup({
			dashboard = {
				header = "asha",
			},
		})
	end,
}
