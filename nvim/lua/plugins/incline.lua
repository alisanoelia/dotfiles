-- config for incline.nvim
---@diagnostic disable: undefined-global

return {
	"b0o/incline.nvim",
	event = "VeryLazy",
	opts = {
		hide = {
			cursorline = false,
		},
		window = {
			padding = 0,
		},
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			local modified = vim.bo[props.buf].modified
			return {
				" ",
				modified and { "+ " } or "",
				filename,
				" ",
				guibg = "#d8a657",
				-- guifg = "#101214",
				guifg = "#1e1e1e",
				gui = "bold",
			}
		end,
	},
}
