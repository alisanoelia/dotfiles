-- plugin for autocomplete

return {
	"Exafunction/codeium.nvim",
	enabled = true,
	event = "InsertEnter",
	opts = {
		enable_chat = true,
		enable_cmp_source = false,
		virtual_text = {
			enabled = true,
			map_keys = true,
			key_bindings = {
				accept = "<C-k>",
				dismiss = "<C-j>",
				next = "<C-]>",
				prev = "<C-[>",
			},
		},
	},
}
