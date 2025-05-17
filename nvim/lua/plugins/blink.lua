---@diagnostic disable: undefined-global

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	opts = {
		keymap = {
			["<cr>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			menu = {
				border = "single",
				scrollbar = false,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 50,
				window = {
					border = "single",
					scrollbar = false,
				},
			},
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
			},
		},
	},
	opts_extend = { "sources.default" },
}
