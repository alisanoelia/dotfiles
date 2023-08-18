return {
        "akinsho/toggleterm.nvim",

        config = function()
                require('toggleterm').setup({
        -- open_mapping = 'tt',
        direction = 'float',
        shade_terminals = true
 })
end,
}
