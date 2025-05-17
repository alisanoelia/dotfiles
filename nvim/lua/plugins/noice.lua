-- noice config

return {
	"folke/noice.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		views = {
			cmdline_popup = {
				border = {
					style = "single",
					padding = { 0, 1 },
				},
			},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = false,
		},
		routes = {
			{
				filter = {
					event = "notify",
					find = "No information available",
				},
				opts = { skip = true },
			},
		},
		cmdline = {
			view = "cmdline_popup",
			format = {
				search_down = { kind = "search", pattern = "^/", icon = ">", lang = "regex" },
			},
		},
	},

	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		-- {
		-- 	"rcarriga/nvim-notify",
		-- 	opts = {
		-- 		fps = 75,
		-- 		stages = "fade",
		-- 		render = "minimal",
		-- 		background_colour = "#1d2021",
		-- 		timeout = 50,
		-- 	},
		-- },
	},
}
