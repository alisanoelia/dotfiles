return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  dependencies = {'nvim-lua/plenary.nvim'},

  config = function()
    require('telescope').setup{
      defaults = {
        prompt_prefix = "󰁕 ",
        selection_caret = "> ",
      },
    }
  end
}
