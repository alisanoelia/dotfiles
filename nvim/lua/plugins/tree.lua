---@diagnostic disable: undefined-global

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			renderer = {
				indent_markers = {
					enable = false,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = ">", -- arrow when folder is closed
							arrow_open = "-", -- arrow when folder is open
						},
					},
				},
			},
			sort_by = "case_sensitive",
			actions = {
				open_file = { quit_on_open = true },
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
			},
			filters = {
				custom = { "^.git$", "^node_modules$" },
			},
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end
				api.config.mappings.default_on_attach(bufnr)

				vim.keymap.set("n", "<leader>s", api.node.open.vertical, opts("Open: Vertical Split"))
			end,
		})
	end,
}
