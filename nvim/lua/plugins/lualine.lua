return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lazyUpdates = require("lazy.status")

		local function lsp()
			local active_clients = vim.lsp.get_active_clients()
			if #active_clients > 0 then
				local icon = ' '
				local client = active_clients[1]
				return icon .. client.messages.name
			else
				return "No hay clientes LSP activos"
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
				-- theme = "everforest",		
				theme = "auto",
				component_separators = { left = '>', right = '<' },
				-- section_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = {
					{ function()
						return '󰉋 '
					end },
					{ 'filename', path = 4 }, 'filetype' },
				lualine_c = { 'branch', 'diagnostics', 'diff' },

				lualine_x = {},

				lualine_y = { lsp, { lazyUpdates.updates, cond = lazyUpdates.has_updates} },

				lualine_z = { file_size, 'progress' },
			},

			extensions = { 'nvim-tree' },
		}
	end
}
