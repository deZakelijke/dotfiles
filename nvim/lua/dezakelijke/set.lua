vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.smarttab = true
vim.opt.autoindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.hidden = true

vim.opt.wrap = false

vim.opt.colorcolumn = '88'
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true

vim.opt.updatetime = 50

vim.opt.foldmethod = 'indent'
vim.opt.foldenable = false
vim.opt.foldnestmax = 10
vim.opt.foldlevel = 1

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.python_host_prog = '/usr/bin/python3'
