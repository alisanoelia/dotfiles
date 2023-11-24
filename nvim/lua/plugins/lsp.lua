---@diagnostic disable: undefined-global

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

		-- Snippets
		{ 'L3MON4D3/LuaSnip' },
		{ 'rafamadriz/friendly-snippets' },
		{ 'onsails/lspkind.nvim' },

		-- others
		{ "folke/neodev.nvim" },
	},

	config = function()
		-- neodev
		require("neodev").setup()

		--LSP and Mason
		local lsp_zero = require('lsp-zero')
		local maps = vim.keymap.set
		maps('n', 'f=', ':LspZeroFormat <cr>')
		maps("n", "de", vim.diagnostic.open_float)
		maps("n", "gd", vim.lsp.buf.definition)
		maps("n", "gh", vim.lsp.buf.hover)

		lsp_zero.on_attach(function(_, bufnr)
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

		cmp.setup({
			mapping = map,
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
				{ name = 'path' },
				{ name = 'cmdline' },
			},
			formatting = {
				fields = { 'abbr', 'kind', 'menu' },
				format = require('lspkind').cmp_format({
					mode = 'symbol_text', -- show only symbol annotations
					maxwidth = 50,     -- prevent the popup from showing more than provided characters
				})
			}
		})

		-- Use buffer source for `/`.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':'.
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
				{ name = "cmdline" },
			}),
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
