-- avante plugin

return {
	"yetone/avante.nvim",
	event = "BufReadPre",
	lazy = false,
	enabled = true,
	version = false,
	config = function()
		require("avante").setup({
			---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
			provider = "copilot", -- or "copilot", "gemini", "ollama"
			vendors = {
				openrouter = {
					__inherited_from = "openai",
					endpoint = "https://openrouter.ai/api/v1",
					api_key_name = "OPENROUTER_API_KEY",
					temperature = 0,
					-- model = "deepseek/deepseek-r1",
					model = "deepseek/deepseek-r1-distill-llama-70b",
				},
				ollama = {
					__inherited_from = "openai",
					api_key_name = "",
					endpoint = "http://127.0.0.1:11434/v1",
					model = "qwen2.5:1.5b",
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
			copilot = {
				model = "claude-3.5-sonnet", -- or "gpt-4o"
				temperature = 0,
				max_tokens = 8192,
			},
			gemini = {
				model = "gemini-2.0-flash-exp", -- or "gemini-1.5-pro", "gemini-2.0-flash-exp", "gemini-exp-1206", "gemini-1.5-flash"
				temperature = 0,
				max_tokens = 8192,
			},
		})
	end,
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
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
			opts = { file_types = { "Avante" } },
			ft = { "Avante" },
		},
	},
}
