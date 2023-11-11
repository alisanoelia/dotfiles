return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lazy_status = require("lazy.status")

		local function lsp()
			local active_clients = vim.lsp.get_active_clients()
			if #active_clients > 0 then
				local icon = ' '
				local client = active_clients[1]
				return icon .. client.messages.name
			else
				return "No hay clientes LSP activos."
			end
		end

		local function file_size()
			local size = vim.fn.getfsize(vim.fn.expand('%:p'))
			local suffixes = { 'B', 'KB', 'MB', 'GB', 'TB' }
			local i = 1

			while size > 1024 do
				size = size / 1024
				i = i + 1
			end

			return string.format('%.2f %s', size, suffixes[i])
		end

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '▎', right = '▎' },
				section_separators = { left = '', right = '' },
				globalstatus = true,
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { { 'filename', path = 3 }, 'filetype' },
				lualine_c = { 'diagnostics', 'branch', 'diff' },
				lualine_x = {},
				lualine_y = { lsp, { lazy_status.updates, cond = lazy_status.has_updates } },
				lualine_z = { file_size, 'progress' },
			},
			extensions = { 'nvim-tree' },
		}
	end
}
