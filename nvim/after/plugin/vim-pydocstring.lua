vim.g.pydocstring_doq_path = "/home/micha/.pyenv/shims/doq"
vim.g.pydocstring_enable_mappings = 0
vim.g.pydocstring_formatter = "google"
vim.keymap.set("n", "<leader>cf", ":Pydocstring<cr>", { silent = true })
vim.keymap.set("n", "<leader>ca", ":PydocstringFormat<cr>", { silent = true })
