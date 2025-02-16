---@diagnostic disable: undefined-global

local function setup_diagnostic_yank()
	function _G.YankDiagnosticError()
		local bufnr = vim.api.nvim_get_current_buf()
		local line_nr = vim.api.nvim_win_get_cursor(0)[1] - 1
		local diagnostics = vim.diagnostic.get(bufnr, { lnum = line_nr })

		if #diagnostics == 0 then
			vim.notify("No hay diagnósticos en esta línea", vim.log.levels.WARN)
			return
		end

		local messages = {}
		for _, diag in ipairs(diagnostics) do
			local severity = vim.diagnostic.severity[diag.severity] or "UNKNOWN"
			table.insert(messages, string.format("[%s] %s", severity:sub(1, 1), diag.message))
		end

		local text = table.concat(messages, "\n")
		vim.fn.setreg("+", text)
		vim.notify(string.format("Copiados %d errores al portapapeles", #diagnostics))
	end
end

local function setup_lsp_keymaps()
	local map = vim.keymap.set
	map("n", "de", vim.diagnostic.open_float)
	map("n", "gd", vim.lsp.buf.definition)
	map("n", "gh", vim.lsp.buf.hover)
	map("n", "e[", vim.diagnostic.goto_prev)
	map("n", "e]", vim.diagnostic.goto_next)
	map("n", "<leader>ce", [[:lua YankDiagnosticError()<CR>]])
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

local function mason()
	return require("mason").setup({
		ui = {
			border = "single",
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
		mason()
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
