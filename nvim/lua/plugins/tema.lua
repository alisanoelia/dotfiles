return {
  "catppuccin/nvim", name = "catppuccin",

  lazy = false,
    priority=1000,
    config = function()
        require("catppuccin").setup({
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
        vim.cmd.colorscheme("catppuccin")
    end
}
