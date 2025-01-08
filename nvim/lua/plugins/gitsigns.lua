---@diagnostic disable: undefined-global

return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	event = "VeryLazy",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup({
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
				delay = 200,
				ignore_whitespace = false,
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

			on_attach = function(bufnr)
				vim.keymap.set("n", "<leader>hu", gitsigns.undo_stage_hunk, { buffer = bufnr })
				vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr })
				vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr })
				vim.keymap.set("n", "<leader>hj", gitsigns.next_hunk, { buffer = bufnr })
				vim.keymap.set("n", "<leader>hk", gitsigns.prev_hunk, { buffer = bufnr })
				vim.keymap.set("n", "<leader>gi", gitsigns.toggle_current_line_blame)
			end,
			max_file_length = 10000,
		})
	end,
}
