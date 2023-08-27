return {
  'echasnovski/mini.nvim',

  config = function()
		require('mini.animate').setup()
    require('mini.comment').setup()
    require('mini.cursorword').setup()
    require('mini.pairs').setup()
    require('mini.surround').setup()
		require('mini.starter').setup()
		require('mini.indentscope').setup({
			symbol = "|"
		})
  end
}
