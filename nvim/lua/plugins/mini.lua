return {
	'echasnovski/mini.nvim',
	config = function()
		-- require('mini.ai').setup()
		require('mini.animate').setup()
		require('mini.comment').setup()
		-- require('mini.cursorword').setup()
		require('mini.indentscope').setup({
			symbol = '▏'
		})
		require('mini.pairs').setup()
		require('mini.surround').setup()
		-- require('mini.fuzzy').setup()
	end
}
