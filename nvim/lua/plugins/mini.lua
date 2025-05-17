return {
	"echasnovski/mini.nvim",
	config = function()
		-- require("mini.animate").setup()
		require("mini.bracketed").setup()
		require("mini.comment").setup()
		-- require("mini.indentscope").setup({
		-- 	symbol = "▏",
		-- })
		require("mini.pairs").setup()
		require("mini.surround").setup()
	end,
}
