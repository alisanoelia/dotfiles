return {
	'Everblush/nvim',
	lazy = true,	
	config = function()
		require('everblush').setup({
    transparent_background = true,
    nvim_tree = {
        contrast = false,
    },
	})
	vim.cmd[[colorscheme everblush]]
	end
}
