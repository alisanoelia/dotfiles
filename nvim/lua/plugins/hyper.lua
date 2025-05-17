return {
	"wet-sandwich/hyper.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("hyper").setup()
	end,
}
