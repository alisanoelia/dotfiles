return {
  'rose-pine/neovim',
  lazy = false,
    priority=1000,
    config = function()
        require("lazy").setup({
          { 'rose-pine/neovim', name = 'rose-pine' },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            styles = {
              comments = {"italic"},
              conditionals = {"italic"},
              loops = {"italic"},
              functions = {"italic"},
              keywords = {"italic"},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {"italic"},
              types = {},
              operators = {},
            },
        })
        vim.cmd.colorscheme("rose-pine")
    end
}
