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
      manage_nvim_cmp = true,
      set_lsp_keymaps = true,
    })
    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)
    -- CMP
    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()
    require('luasnip.loaders.from_vscode').lazy_load()

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
        {name = 'luasnip'}
      },
    })
    lsp.set_sign_icons({
      error = '✘',
      warn = '▲',
      hint = '⚑',
      info = ''
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
    lsp.setup()
  end
}
