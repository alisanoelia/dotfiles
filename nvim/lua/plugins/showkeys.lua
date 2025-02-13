-- showkeys config

return {
	"nvzone/showkeys",
	lazy = true,
	event = "VeryLazy",
	cmd = "ShowkeysToggle",
	opts = {
		position = "bottom-center",
		maxkeys = 3,
		show_count = true,
		winopts = {
			focusable = false,
			relative = "editor",
			style = "minimal",
			border = "single",
			height = 1,
			row = 1,
			col = 0,
		},
	},
}
