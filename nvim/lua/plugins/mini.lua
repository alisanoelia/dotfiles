return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.animate").setup()
		require("mini.comment").setup()
		require("mini.indentscope").setup({
			symbol = "▏",
		})
		require("mini.pairs").setup()
		require("mini.surround").setup()
	end,
}
