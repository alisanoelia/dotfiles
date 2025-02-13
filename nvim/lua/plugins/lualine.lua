---@diagnostic disable: undefined-global

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
			local size = vim.fn.getfsize(vim.fn.expand("%:p")) / 1024 -- Convertir directamente a KB
			local suffixes = { "KB", "MB", "GB", "TB" }
			local i = 1 -- Empezar en KB

			while size >= 1024 do
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
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "filename", path = 4 },
				},
				lualine_c = { "branch", "diagnostics", "diff", codeium },

				lualine_x = {
					file_size,
				},

				lualine_y = { { lazyUpdates.updates, cond = lazyUpdates.has_updates } },

				lualine_z = { lsp },
			},

			extensions = { "nvim-tree" },
		})
	end,
}
