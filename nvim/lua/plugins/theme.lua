return {
	"EdenEast/nightfox.nvim",

	config = function()
		require('nightfox').setup({
			options = {
				styles = {      -- Style to be applied to different syntax groups
					comments = "italic", -- Value is any valid attr-list value `:help attr-list`
					conditionals = "italic",
					constants = "NONE",
					functions = "NONE",
					keywords = "italic",
					numbers = "NONE",
					operators = "NONE",
					strings = "NONE",
					types = "italic",
					variables = "italic",
				},
			},
		})

		vim.cmd("colorscheme terafox")
	end,
}

-- return {
-- 	'navarasu/onedark.nvim',
-- 	config = function()
-- 		-- Lua
-- 		require('onedark').setup {
-- 			style = 'darker', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
-- 			transparent = true,
--
-- 			code_style = {
-- 				comments = 'italic',
-- 				keywords = 'italic',
-- 				functions = 'none',
-- 				strings = 'none',
-- 				variables = 'none'
-- 			},
--
-- 			-- Plugins Config --
-- 			diagnostics = {
-- 				darker = true, -- darker colors for diagnostic
-- 				undercurl = true, -- use undercurl instead of underline for diagnostics
-- 				background = true, -- use background color for virtual text
-- 			},
-- 		}
-- 		vim.cmd("colorscheme onedark")
-- 	end
-- }
