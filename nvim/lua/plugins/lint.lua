---@diagnostic disable: undefined-global

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		require("lint").linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
