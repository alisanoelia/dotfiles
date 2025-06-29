-- blink.cmp
---@diagnostic disable: undefined-global

return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"Kaiser-Yang/blink-cmp-dictionary",
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
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		sources = {
			default = {
				"snippets",
				"lsp",
				"path",
				"buffer",
				"dictionary",
			},
			providers = {
				dictionary = {
					module = "blink-cmp-dictionary",
					name = "Dict",
					score_offset = 20,
					enabled = true,
					max_items = 8,
					min_keyword_length = 3,
					opts = {
						dictionary_directories = { vim.fn.expand("~/.config/nvim/dict") },
					},
				},
			},
		},
	},
}
