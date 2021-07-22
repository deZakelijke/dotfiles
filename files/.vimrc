" Line numbers and tabs
set number
set relativenumber
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set autoindent
set smartindent
set noswapfile
set scrolloff=8
syntax on
let mapleader="."

" Remaps
nnoremap <space> i<space><right><esc>
nmap <CR> o<Esc>k
inoremap jj <Esc>
nnoremap <leader>h :noh<CR>

" Move singe line up or down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Autocompletion
set wildmenu
set wildmode=list:longest,full

" Replace preview
if has("nvim")
    set inccommand=nosplit
endif


" Plug plugin manager
" https://github.com/junegunn/vim-plug
" For NeoVim run:
" sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
" Add the followign linse to  ~/.config/nvim/init.vim
"
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath&=runtimepath
" source ~/.vimrc
"
" After installation run :PlugInstall

call plug#begin('~/.vim/plugged')

" Colour scheme
Plug 'sjl/badwolf'
Plug 'nightsense/carbonized'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" Lightline status bar colouring
Plug 'itchyny/lightline.vim'

" tcomment_vim line commenter
Plug 'tomtom/tcomment_vim'

" Pydocstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" ALE(Asynchronous Lint Engine)
Plug 'dense-analysis/ale'

" UndoTree
Plug 'mbbill/undotree'

" Telescope
if has("nvim")
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
endif

" Easymotion
Plug 'easymotion/vim-easymotion'

call plug#end()

" Colourscheme settings
syntax enable
if has("termguicolors")
    set termguicolors
endif
colorscheme OceanicNext

" Python docstring style
let g:pydocstring_formatter = 'google'

" Toggle undoTree
nnoremap <F5> :UndotreeToggle<CR>

" ALE Fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['autopep8', 'black'],
\}
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 100
let g:ale_python_pylint_options = "--generate-members"
let g:ale_python_flake8_options = "--max-line-length=88"
let g:python3_host_prog = "/usr/bin/python3"

" Telescope maps
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
