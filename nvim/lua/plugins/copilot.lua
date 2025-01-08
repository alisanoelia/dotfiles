-- setup copilot in lua for neovim

return {
	"zbirenbaum/copilot.lua",
	enabled = false,
	cmd = "Copilot",
	event = { "InsertEnter" },
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
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
		})
	end,
}
