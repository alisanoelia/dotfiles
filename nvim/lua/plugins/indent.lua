return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	lazy = true,
	config = function()
		require('ibl').setup()
	end
}
