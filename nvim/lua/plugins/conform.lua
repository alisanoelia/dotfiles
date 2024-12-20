return {
	'stevearc/conform.nvim',
	lazy = true,
	enabled = false,
	event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
	config = function()
		require('conform').setup {
			formatters_by_ft = {
				lua = { 'stylua' },
				javascript = { 'eslint_d' },
				typescript = { 'eslint_d' },
				javascriptreact = { 'eslint_d' },
				typescriptreact = { 'eslint_d' },
				css = { 'prettierd' },
				html = { 'prettierd' },
				json = { 'prettierd' },
				yaml = { 'prettierd' },
				markdown = { 'prettierd' },
				graphql = { 'prettierd' },
			},

			format_on_save = {
				pattern = '.lua,*.graphql,*.css,*.html,*.json,*.yaml,*.md,*.gql,*.rs',
				timeout_ms = 500,
				async = false,
				lsp_fallback = true,
			},
		}
	end,
}
