---@diagnostic disable: undefined-global

return {
	"lewis6991/gitsigns.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	event = "VeryLazy",
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		current_line_blame = false,
		current_line_blame_opts = {
			virt_text = true,
			virt_text_pos = "right_align",
			delay = 200,
			ignore_whitespace = false,
		},
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		max_file_length = 10000,
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr })
			vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr })
			vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr })
			vim.keymap.set("n", "<leader>hj", gs.next_hunk, { buffer = bufnr })
			vim.keymap.set("n", "<leader>hk", gs.prev_hunk, { buffer = bufnr })
			vim.keymap.set("n", "<leader>gi", gs.toggle_current_line_blame)
		end,
	},
}
