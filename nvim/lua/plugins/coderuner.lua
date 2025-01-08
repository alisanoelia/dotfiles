return {
	"CRAG666/code_runner.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	event = "VeryLazy",
	config = function()
		require("code_runner").setup({
			-- put here the commands by filetype
			filetype = {
				java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
				python = "python3 -u",
				typescript = "node run",
				rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
				go = "go run",
			},
		})
	end,
}
