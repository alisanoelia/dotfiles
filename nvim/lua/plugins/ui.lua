return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    'rcarriga/nvim-notify'
  },

  config = function ()
    require("noice").setup({})

    vim.notify = require("notify")

    require("notify").setup({
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = ""
      },
      level = 2,
      minimum_width = 50,
      maximum_width = 50,
      render = "compact",
      stages = "fade",
      timeout = 5000,
      background_colour = "#000000"
    })

  end
}
