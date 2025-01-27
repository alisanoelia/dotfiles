---@diagnostic disable: undefined-global

vim.cmd([[
    augroup RestoreCursorShapeOnExit
        autocmd!
				" autocmd VimLeave * set guicursor=a:hor100-blinkon500-blinkoff500
				autocmd VimLeave * set guicursor=a:ver40-blinkon500-blinkoff500
    augroup END
]])

-- vim.cmd([[
--     augroup RestoreCursorShapeOnExit
--         autocmd!
--         autocmd VimLeave * set guicursor=a:ver25-blinkon500-blinkoff500
--     augroup END
-- ]])
