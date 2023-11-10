return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v3.x',
  dependencies = {
    -- LSP and mason
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip'},
		{'hrsh7th/cmp-buffer'},
		{'hrsh7th/cmp-path'},
		{'hrsh7th/cmp-nvim-lsp'},
    -- Snippets
    {'L3MON4D3/LuaSnip'},
    {'rafamadriz/friendly-snippets'},
	},
	config = function()

		--LSP and Mason
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({buffer = bufnr})

		end)

		lsp_zero.set_sign_icons({
			error = '✘',
			warn = '▲',
			hint = '⚑',
			info = '»'
		})

		require('mason').setup({})
		require('mason-lspconfig').setup({
			handlers = {
				lsp_zero.default_setup,
			}
		})
		-- CMP
    local cmp = require("cmp")
		local cmp_action = require('lsp-zero').cmp_action()
    require('luasnip.loaders.from_vscode').lazy_load()

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				['<CR>'] = cmp.mapping.confirm({select = true}),
				['<Tab>'] = cmp_action.tab_complete(),
				['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
			}),
			preselect = "item",
			completion = {
				completeopt = 'menu,menuone,noinsert',
			},
			window = {
				completion = cmp.config.window.bordered({
					scrollbar = false,
				}),
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{name = 'nvim_lsp'},
				{name = 'buffer'},
				{name = 'luasnip'},
				{name = 'path'}
			},
			formatting = {
				fields = {'abbr', 'kind', 'menu'},
				format = require('lspkind').cmp_format({
					mode = 'symbol_text', -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters
				})
			}
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
