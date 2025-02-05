---@diagnostic disable: undefined-global

return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	opts = {
		keymap = {
			preset = "enter",
			-- ["<Cr>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
		},
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
			menu = {
				border = "rounded",
				scrollbar = false,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = "rounded",
					scrollbar = false,
				},
			},
		},
		appearance = {
			use_nvim_cmp_as_default = false,
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
