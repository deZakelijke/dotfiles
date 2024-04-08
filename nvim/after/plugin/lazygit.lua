vim.g.lazygit_floating_window_winblend = 1.0  -- Transparency of floating window
vim.g.lazygit_floating_window_use_plenary = 1  -- Use plenary.vim to manage floating window
vim.keymap.set('n', '<leader>gg', ':LazyGit<cr>', { silent = true })
vim.keymap.set('n', '<leader>flg', 'require("telescope").extensions.lazygit.lazygit()<cr>', { silent = true })
