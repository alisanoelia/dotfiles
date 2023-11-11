return {
  "utilyre/barbecue.nvim",
	lazy = false,
	prioity = 1000,
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
     require("barbecue").setup()
  end
}
