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
    local lspkind = require 'lspkind'
    require('luasnip.loaders.from_vscode').lazy_load()
		local map = {
			["<CR>"] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
				else
					fallback()
				end
				end, {
					"i",
					"s",
			}),
		}

		cmp.setup({
			mapping = map,
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
				format = function(entry, vim_item)
					if vim.tbl_contains({ 'path' }, entry.source.name) then
						local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end
					return lspkind.cmp_format({ with_text = true })(entry, vim_item)
				end
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
