return {
	"nvim-lualine/lualine.nvim",

	dependencies = { 'arkav/lualine-lsp-progress' },

	config = function()
		local lazy_status = require("lazy.status")

		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = false,
				globalstatus = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				}
			},
			sections = {
				lualine_a = { 'mode' },
				lualine_b = { {'filename', path = 3 }},
				lualine_c = { 'diagnostics', 'branch', },
				lualine_x = { 'diff', 'fileformat', { lazy_status.updates, cond = lazy_status.has_updates} },
				lualine_y = { 'lsp_progress', 'filetype' },
				lualine_z = { 'location' }
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { 'filename' },
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}
	end
}
