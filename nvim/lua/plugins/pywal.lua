-- pywal16 color scheme
---@diagnostic disable: undefined-global

return {
	'uZer/pywal16.nvim',
	enabled = false,
	-- for local dev replace with:
	-- dir = '~/your/path/pywal16.nvim',
	config = function()
		vim.cmd.colorscheme("pywal16")
	end,
}
