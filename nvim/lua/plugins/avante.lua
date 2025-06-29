-- avante plugin
---@diagnostic disable: undefined-global

return {
	"yetone/avante.nvim",
	enabled = true,
	build = "make",
	opts = {
		provider = "copilot", -- or "copilot", "gemini", "ollama", "openrouter"
		providers = {
			openrouter = {
				__inherited_from = "openai",
				disable_tools = false,
				endpoint = "https://openrouter.ai/api/v1",
				api_key_name = "OPENROUTER_API_KEY",
				model = "deepseek/deepseek-r1-0528",
				-- model = "deepseek/deepseek-r1:free",
				-- model = "google/gemini-2.5-pro-preview",
				-- model = "meta-llama/llama-4-maverick:free",
				-- model = "deepseek/deepseek-v3-base:free",
				extra_request_body = {
					temperature = 1,
					max_tokens = 8192,
				},
			},
			copilot = {
				model = "claude-3.5-sonnet", -- or "gpt-4o" | "o3-mini" | "claude-3.5-sonnet" | "gpt-4.1"
				-- model = "gpt-4.1-2025-04-14",
				disable_tools = false,
				extra_request_body = {
					temperature = 0.5,
					max_tokens = 8192,
				},
			},
			gemini = {
				model = "gemini-2.5-pro-preview-06-05", -- or "gemini-1.5-pro", "gemini-2.0-flash-exp", "gemini-exp-1206", "gemini-1.5-flash", "gemini-2.0-flash-exp", "gemini-2.0-flash-thinking-exp-01-21", "gemini-2.0-flash"
				extra_request_body = {
					-- temperature = 1,
					-- max_tokens = 8192,
				},
			},
		},
		behaviour = {
			auto_suggestions = false,
			auto_set_highlight_group = true,
			auto_set_keymaps = true,
			auto_apply_diff_after_generation = false,
			support_paste_from_clipboard = true,
			minimize_diff = false,
		},
		windows = {
			position = "right",
			width = 20,
			sidebar_header = {
				enabled = true, -- true, false to enable/disable the header
				align = "right", -- left, center, right for title
				rounded = false,
			},
			input = {
				prefix = "> ",
				height = 5, -- Height of the input window in vertical layout
			},
			edit = {
				border = "single",
				start_insert = true, -- Start insert mode when opening the edit window
			},
			ask = {
				floating = false,
				start_insert = false,
				border = "single",
			},
		},
	},
	dependencies = {
		{ "stevearc/dressing.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{ "MunifTanjim/nui.nvim" },
		{
			"HakonHarnes/img-clip.nvim",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = { insert_mode = true },
					use_absolute_path = true,
				},
				keys = {
					{
						"<leader>p",
						"<cmd>ImagePaster<cr>",
						mode = { "n", "v" },
					},
				},
			},
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			enabled = false,
			opts = {},
			ft = { "Avante", "markdown" },
		},
	},
}
