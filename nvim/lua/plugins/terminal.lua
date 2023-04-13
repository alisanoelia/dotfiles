return {
        "akinsho/toggleterm.nvim",

        config = function()
                require('toggleterm').setup({
        -- open_mapping = 'tt',
        direction = 'horizontal',
        shade_terminals = true
 })
end,
}
