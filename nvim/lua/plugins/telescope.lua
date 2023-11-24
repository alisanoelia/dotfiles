return {
	"nvim-telescope/telescope.nvim",
	event = 'VeryLazy',
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make'
		} },
	opts = {
		extensions = {
			fzf = {
				fuzzy = true,                   -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true,    -- override the file sorter
				case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
			},
		}
	},
	config = function(opts)
		require('telescope').setup(opts)
		require('telescope').load_extension('fzf')
	end,
	keys = {
		{
			"<leader>gf",
			function()
				require('telescope.builtin').git_files({ show_untracked = true })
			end,
			desc = "Telescope Git Files",
		},
		{
			"<leader>bf",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Telescope buffers",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Telescope Git status",
		},
		{
			"<leader>gc",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Telescope Git status",
		},
		{
			"<leader>gb",
			function()
				require("telescope.builtin").git_branches()
			end,
			desc = "Telescope Git branches",
		},
		{
			"<leader>f",
			function()
				require('telescope.builtin').find_files()
			end,
			desc = "Telescope Find Files",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Telescope Help"
		},
		{
			"<leader>br",
			function()
				require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
			end,
			desc = "Telescope file browser"
		}
	},
}
