local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set(
	"n",
	"<leader>fh",
	':lua require("telescope.builtin").find_files( {find_command = {"rg", "--files", "--hidden", "-g", "!.git"}})<cr>',
	{}
)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
