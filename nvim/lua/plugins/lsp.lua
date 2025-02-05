---@diagnostic disable: undefined-global

local function setup_diagnostic_yank()
	function YankDiagnosticError()
		vim.diagnostic.open_float()
		vim.diagnostic.open_float()
		local win_id = vim.fn.win_getid()
		vim.cmd("normal! j")
		vim.cmd("normal! VG")
		vim.cmd("normal! y")
		vim.api.nvim_win_close(win_id, true)
	end
end

local function setup_lsp_keymaps()
	local map = vim.keymap.set
	map("n", "de", vim.diagnostic.open_float)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gh", vim.lsp.buf.hover)
	map("n", "g[", vim.diagnostic.goto_prev)
	map("n", "g]", vim.diagnostic.goto_next)
	map("n", "<leader>ce", [[:lua YankDiagnosticError()<CR>]], { noremap = true, silent = true })
end

local function setup_diagnostics()
	vim.diagnostic.config({
		float = {
			border = "single",
			source = "always",
			header = false,
			prefix = "",
			scope = "line",
		},
	})
end

local function setup_mason()
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
end

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},

	config = function()
		setup_mason()
		setup_diagnostic_yank()
		setup_lsp_keymaps()
		setup_diagnostics()

		require("mason-lspconfig").setup({})
		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
		})
	end,
}
