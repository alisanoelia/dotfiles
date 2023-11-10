return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lazy_status = require("lazy.status")
		local function lsp()
			local active_clients = vim.lsp.get_active_clients()
			if #active_clients > 0 then
				local icon = ' '
				return icon .. active_clients[1].name
			else
				return "No hay clientes LSP activos."
			end
		end

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'codedark',
				component_separators = { left = '▎', right = '▎' },
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { { 'filename', path = 3 }, 'filetype' },
				lualine_c = { 'diagnostics', 'branch', 'diff', lsp },
				lualine_x = { },
				lualine_y = { { lazy_status.updates, cond = lazy_status.has_updates } },
				lualine_z = { 'progress',},
			},
			extensions = { 'nvim-tree' }
		}
	end
}
