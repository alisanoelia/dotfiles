return {
	"j-hui/fidget.nvim",
	enabled = false,
	config = function()
		require("fidget").setup({
			text = {
				spinner = "pipe",
			},
		})
	end,
}
