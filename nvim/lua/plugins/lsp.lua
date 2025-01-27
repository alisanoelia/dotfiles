---@diagnostic disable: undefined-global

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	config = function()
		require("mason").setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				width = 0.7,
				height = 0.7,
			},
		})
		require("mason-lspconfig").setup({})

		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
		})

		-- config lsp maps
		local map = vim.keymap.set

		map("n", "de", vim.diagnostic.open_float)
		map("n", "gd", vim.lsp.buf.definition)
		map("n", "gh", vim.lsp.buf.hover)

		-- copy error lsp float
		map("n", "<leader>ce", [[:lua YankDiagnosticError()<CR>]], { noremap = true, silent = true })

		function YankDiagnosticError()
			vim.diagnostic.open_float()
			vim.diagnostic.open_float()
			local win_id = vim.fn.win_getid() -- get the window ID of the floating window
			vim.cmd("normal! j") -- move down one row
			vim.cmd("normal! VG") -- select everything from that row down
			vim.cmd("normal! y") -- yank selected text
			vim.api.nvim_win_close(win_id, true) -- close the floating window by its ID
		end
		-- config diagnostic
		vim.diagnostic.config({
			float = {
				border = "single",
				source = "always",
				header = false,
				prefix = "",
				scope = "line",
			},
		})
	end,
}
