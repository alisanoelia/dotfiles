
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    options = {
      mode = 'buffers',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local s = ' '
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == 'error' and ' '
                        or (e == 'warning' and ' ' or ' ')
                    s = s .. n .. sym
                end
                return s
            end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
