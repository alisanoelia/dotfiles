return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {"nvim-tree/nvim-web-devicons"},

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      actions = {
        open_file = { quit_on_open = true }
      },
      update_focused_file = {
        enable = true,
        update_cwd = true
      },
      filters = {
        custom = { '^.git$', '^node_modules$' }
      },
      git = {
        enable = false,
      },
      log = {
        enable = true,
        types = {
          diagnostics = true
        }
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        debounce_delay = 50,
        icons = {
          error = '✘',
          warning = '▲',
          hint = '⚑',
          info = ''
        }
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', 's',     api.node.open.vertical, opts('Open: Vertical Split'))
        vim.keymap.set('n', '<c-e>', '<cmd>NvimTreeToggle<cr>',
          { desc = 'toggle', buffer = bufnr, noremap = true, silent = true, nowait = true })
      end
    })
  end
}
