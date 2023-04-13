return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  dependencies = {'nvim-lua/plenary.nvim'},

  config = function()
    local builtin = require("telescope.builtin")

  end
}
