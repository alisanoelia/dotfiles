-- conform config

return {
	"stevearc/conform.nvim",
	enabled = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				shell = { "shfmt" },
				bash = { "shfmt" },
			},

			format_on_save = {
				pattern = "*.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs,*.js,*.ts,*.jsx,*.tsx,*.sh",
				timeout_ms = 10000,
				async = false,
				lsp_fallback = true,
			},
		})
	end,
}
