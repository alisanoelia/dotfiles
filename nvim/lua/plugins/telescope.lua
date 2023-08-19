return {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
  dependencies = {'nvim-lua/plenary.nvim'},

  config = function()
    require('telescope').setup{
      defaults = {
        prompt_prefix = "󰁕 ",
        selection_caret = "> ",
        file_ignore_patterns = { "node_modelues", "yarn.lock" },
        dynamic_preview_title = true,
        path_display = { 'smart' },
      },
      pickers = {
          find_files = {
            hidden = true
          }
        },
        layout_config = {
          horizontal = {
            preview_cutoff = 100,
            preview_width = 0.6
          }
        }
    }
  end
}
