-- dashboard config

return {
	"folke/snacks.nvim",
	event = "VimEnter",
	opts = {
		dashboard = {
			pane_gap = 4,
			preset = {
				header = [[asha]],
			},
			sections = {
				{ section = "header" },
				{ section = "startup" },
			},
		},
	},
}
