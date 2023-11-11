return {
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({
			progress = {
				poll_rate = 1,
			},

			display = {
				done_ttl = 10,
				progress_icon = 2,
			}

		})
	end
}
