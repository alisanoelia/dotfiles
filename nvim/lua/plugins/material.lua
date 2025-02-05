---@diagnostic disable: undefined-global

return {
	"sainnhe/gruvbox-material",
	enabled = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_transparent_background = 1
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_float_style = "mix"
		vim.g.gruvbox_material_statusline_style = "mix"
		vim.g.gruvbox_material_statusline_style = "mix"
		vim.g.gruvbox_material_cursor = "auto"
		vim.g.gruvbox_material_better_performance = 1

		vim.cmd.colorscheme("gruvbox-material")
	end,
}
