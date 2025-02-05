return {
	"windwp/nvim-ts-autotag",
	enabled = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		})
	end,
}
