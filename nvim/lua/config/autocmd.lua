-- vim.api.nvim_create_autocmd("VimLeave", {
-- 	callback = function()
-- 		vim.cmd("set guicursor=")
-- 		print("\x1b[ q") -- Restablece el cursor al predeterminado
-- 	end,
-- })

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
