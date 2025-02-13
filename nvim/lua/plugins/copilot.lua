-- setup copilot in lua for neovima

return {
	"zbirenbaum/copilot.lua",
	enabled = true,
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = false,
			auto_trigger = true,
			hide_during_completion = false,
			debounce = 0,
			keymap = {
				accept = "<C-k>",
				accept_word = false,
				accept_line = false,
				next = "<C-]>",
				prev = "<C-[>",
				dismiss = "<C-j>",
			},
		},
	},
}
