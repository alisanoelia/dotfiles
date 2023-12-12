return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	main = "ibl",
	config = function()
		require('ibl').setup({
			indent = {
				char = "|",
				smart_indent_cap = true,
			},
			scope = {
				enabled = true
			}
		})
	end
}
