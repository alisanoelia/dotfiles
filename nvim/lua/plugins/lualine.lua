-- lualine config
---@diagnostic disable: undefined-global
---@autor: asha

return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local lazyUpdates = require("lazy.status")

		local function lsp()
			local active_clients = vim.lsp.get_active_clients()
			if #active_clients > 0 then
				local icon = ""
				local client = active_clients[1]
				return icon .. client.messages.name
			else
				return "not lsp"
			end
		end

		local function file_size()
			local size = vim.fn.getfsize(vim.fn.expand("%:p"))
			local suffixes = { "B", "KB", "MB", "GB", "TB" }
			local i = 1

			while size > 1024 do
				size = size / 1024
				i = i + 1
			end

			return string.format("%.2f %s", size, suffixes[i])
		end

		local function codeium()
			local status = require("codeium.virtual_text").status_string()
			return " " .. status
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "pywal16-nvim",
				-- theme = "solarized-osaka",
				theme = "auto",
				component_separators = { left = "", right = "" },
				-- section_separators = { left = '', right = '' },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					-- { function()
					-- 	return '󰉋 '
					-- end },
					{ "filename", path = 4 },
				},
				lualine_c = { "branch", "diagnostics", "diff", codeium },

				lualine_x = {
					-- 'filetype'
				},

				lualine_y = { { lazyUpdates.updates, cond = lazyUpdates.has_updates } },

				lualine_z = { lsp },
			},

			extensions = { "nvim-tree" },
		})
	end,
}
