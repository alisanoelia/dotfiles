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
      render = "minimal",
      stages = "fade",
      timeout = 10
    })

  end
}
