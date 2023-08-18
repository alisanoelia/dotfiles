return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
                options = {
                    theme = 'rose-pine',
                    icons_enabled = true,
                    globalstatus = true,
                },
                extensions = { "quickfix", "fugitive" },
                sections = {
                    lualine_a = { { "mode", upper = true } },
                    lualine_b = { { "branch", icon = "" }, "db_ui#statusline" },
                    lualine_c = { { "filename", file_status = true, path = 3 } },
                    lualine_x = {
                        "diagnostics", "diff",
                        {
                            require("lazy.status").updates,
                            cond = require("lazy.status").has_updates,
                            color = { fg = "ff9e64" },
                        }
                    },
                    lualine_y = { "filetype" },
                    lualine_z = {},
                },
            }
        )
    end,
}
