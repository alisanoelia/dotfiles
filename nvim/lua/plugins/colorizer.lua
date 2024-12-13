return {
	'NvChad/nvim-colorizer.lua',
	lazy = false,
	config = function()
		require 'colorizer'.setup({
			user_default_options = {
				tailwind = true,
			}
		})
	end
}
