return {
	"mg979/vim-visual-multi",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{ "<C-n>", "<Plug>(VM-Add-Cursor-Down)", mode = { "n", "v" } },
		{ "<C-p>", "<Plug>(VM-Add-Cursor-Up)", mode = { "n", "v" } },
	},
}
