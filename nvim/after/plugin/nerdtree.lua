vim.keymap.set('n', '<F8>', ':NERDTreeToggle<CR>')
-- Close NERDTree if it is the last window
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function()
--         if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() then
--             quit
--         end
--     end
-- })
