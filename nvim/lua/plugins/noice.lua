-- noice plugin

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},

	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = false,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
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
				format = {
					search_down = { kind = "search", pattern = "^/", icon = ">", lang = "regex" },
				},
			},
		})
		require("notify").setup({

			fps = 75,
			stages = "fade",
			render = "minimal",
			background_colour = "#131516",
			timeout = 50,
			top_down = true,
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
		})
	end,
}
