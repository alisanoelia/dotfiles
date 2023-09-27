return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'mason-org/mason-registry'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional
    {"hrsh7th/cmp-cmdline"},
    -- Snippets
    {'L3MON4D3/LuaSnip'}, -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  },
  config = function()
    -- LSP
    local lsp = require("lsp-zero")
    lsp.preset({
      name = "recommended",
      configure_diagnostics = false,
      suggest_lsp_servers = true,
      manage_nvim_cmp = {
        set_format = false,
      },
      set_lsp_keymaps = false,
    })
    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)
    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = ''
    })
    lsp.setup()

    -- CMP
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    local lspkind = require 'lspkind'
    require('luasnip.loaders.from_vscode').lazy_load()
		require('luasnip').filetype_extend("javascript", { "javascriptreact" })
		require('luasnip').filetype_extend("javascript", { "html" })

    cmp.setup({
      mapping = {
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp_action.luasnip_supertab(),
      },
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

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
          { name = 'cmdline' }
        })
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
