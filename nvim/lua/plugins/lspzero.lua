return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	dependencies = {
		-- LSP and mason
		{ 'neovim/nvim-lspconfig' },
		{ 'williamboman/mason.nvim' },
		{ 'williamboman/mason-lspconfig.nvim' },

		-- Autocompletion
		{ 'hrsh7th/nvim-cmp' },
		{ 'saadparwaiz1/cmp_luasnip' },
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-path' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-cmdline' },
		{'roobert/tailwindcss-colorizer-cmp.nvim'},
		-- Snippets
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
	},
	config = function()
		--LSP and Mason
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		lsp_zero.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»'
		})

		require('mason').setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				},
				width = 0.7,
				height = 0.7,
			},


		})
		require('mason-lspconfig').setup({
			handlers = {
				lsp_zero.default_setup,
			},
		})
		-- CMP
		local cmp = require("cmp")
		local cmp_action = require('lsp-zero').cmp_action()
		require('luasnip.loaders.from_vscode').lazy_load()

		local map = cmp.mapping.preset.insert({
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			['<Tab>'] = cmp_action.tab_complete(),
			["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
		})
		local complete = "menu,menuone,noinsert"

		cmp.setup({
			mapping = map,
			preselect = "item",
			completion = {
				completeopt = complete,
			},
			window = {
				completion = cmp.config.window.bordered({
					scrollbar = false,
				}),
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
				{ name = 'luasnip' },
				{ name = 'path' }
			},
			formatting = {
				fields = { 'abbr', 'kind', 'menu' },
				format = require('lspkind').cmp_format({
					mode = 'symbol_text', -- show only symbol annotations
					maxwidth = 50,   -- prevent the popup from showing more than provided characters
				})
			}
		})
		-- `:` cmdline setup.
		-- Use buffer source for `/`.
		cmp.setup.cmdline("/", {
			preselect = "item",
			completion = {
				completeopt = complete,
			},
			mapping = map,
			sources = {
				{ name = "buffer" },
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		})

		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(":", {
			preselect = "item",
			completion = {
				completeopt = complete,
			},
			mapping = map,
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
			experimental = {
				ghost_text = true,
				native_menu = false,
			},
		})

		vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			float = {
				style = 'minimal',
				border = 'rounded',
				source = 'always',
				header = '',
				prefix = '',
			},
		})
	end
}
