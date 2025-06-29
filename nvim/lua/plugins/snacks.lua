-- dashboard config
---@diagnostic disable: undefined-global

return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	--	event = "VimEnter",
	opts = {
		bigfile = {
			enabled = true,
		},
		lazygit = {
			enabled = true,
		},
		scroll = {
			enabled = true,
			animate = {
				duration = { step = 15, total = 250 },
				easing = "linear",
			},
			-- faster animation when repeating scroll after delay
			animate_repeat = {
				delay = 100, -- delay in ms before using the repeat animation
				duration = { step = 1, total = 50 },
				easing = "linear",
			},
			-- what buffers to animate
			filter = function(buf)
				return vim.g.snacks_scroll ~= false
					and vim.b[buf].snacks_scroll ~= false
					and vim.bo[buf].buftype ~= "terminal"
			end,
		},
		notifier = {
			enabled = false,
			timeout = 3000,
			style = "compact",
			level = vim.log.levels.TRACE,
		},
		indent = {
			enabled = true,
			indent = {
				char = "",
			},
			scope = {
				char = "│",
			},
			animate = {
				enabled = false,
			},
		},
		zen = {
			enabled = true,
			minimal = false,
			toggles = {
				dim = true,
			},
		},
		dashboard = {
			pane_gap = 4,
			preset = {
				header = [[asha]],
			},
			sections = {
				{ section = "header" },
				{ section = "startup" },
			},
		},
	},

	-- keymaps for snacks
	keys = {
		{
			"<leader>ds",
			function()
				Snacks.zen()
			end,
			desc = "Snacks zen",
		},
		{
			"<leader>lg",
			function()
				Snacks.lazygit()
			end,
			desc = "Snacks lazygit",
		},
	},
}
