return {
  'echasnovski/mini.nvim',

  config = function()
    require('mini.comment').setup()
    require('mini.ai').setup()
    require('mini.cursorword').setup()
    require('mini.pairs').setup()
    require('mini.trailspace').setup()
    require('mini.surround').setup()
  end
}
