-- Telescope.nvim plugin
---@diagnostic disable: undefined-global

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	lazy = true,
	config = function()
		require("telescope").load_extension("fzf")
	end,
	opts = {
		defaults = {
			file_ignore_patterns = {
				"node_modules",
				"android",
			},
			mappings = {
				i = {
					["vs"] = require("telescope.actions").select_vertical,
				},
				n = {
					["vs"] = require("telescope.actions").select_vertical,
				},
			},
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
		},
	},

	keys = {
		{
			"<leader>gf",
			function()
				require("telescope.builtin").git_files({ show_untracked = true })
			end,
			desc = "Telescope Git Files",
		},
		{
			"<leader>bf",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope Buffers",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Telescope Git Status",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Telescope Git Commits",
		},
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Telescope Git Branches",
		},
		{
			"<leader>fl",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Telescope Find Files",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope Help Tags",
		},
	},
}
