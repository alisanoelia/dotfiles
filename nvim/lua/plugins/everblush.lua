-- everblush color scheme
---@diagnostic disable: undefined-global

return {
	'Everblush/nvim',
	enabled = false,
	config = function()
		require('everblush').setup {}
		vim.cmd [[ colorscheme everblush ]]
	end
}
