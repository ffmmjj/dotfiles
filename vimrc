set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
"" Add all your plugins here (note older versions of Vundle used Bundle
"  instead of Plugin)
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'tmhedberg/SimpylFold'

"" Search using Ack
Plugin 'mileszs/ack.vim'
Plugin 'w0rp/ale'

"" Python-specific plugins
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'ycm-core/YouCompleteMe'


"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" BASICS
:let mapleader = ","
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set pastetoggle=<F2>
set clipboard=unnamed
:imap jk <Esc>
set hlsearch   " Highlight searches
set incsearch  " Show the `best match so far' astyped
" Avoid mistyping commands
command! W w
command! Wq wq
" Avoid expanding tabs into spaces when editing Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

"" CODING
" Highlights matching characters [{()}]
set showmatch
set tags=./tags;
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"" Python-specific
let python_highlight_all=1
syntax on
au BufNewFile,BufRead *.py
    \ set tabstop=4      |
    \ set softtabstop=4  |
    \ set shiftwidth=4   |
    \ set textwidth=119  |
    \ set expandtab      |
    \ set autoindent     |
    \ set fileformat=unix
" Python with virtualenv support
let g:ycm_python_binary_path = 'python'
let g:ycm_confirm_extra_conf = 0


"" CtrlP settings
let g:ctrlp_switch_buffer = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


"" vim-airline settings
set ttimeoutlen=50
let g:airline_theme = 'powerlineish'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1
set statusline=%f
set laststatus=2

set backspace=indent,eol,start

"" Markdown + Mathjax specs
" This gets rid of the nasty _ italic bug in tpope's vim-markdown
" block $$...$$
syn region math start=/\$\$/ end=/\$\$/
" inline math
syn match math '\$[^$].\{-}\$'

" actually highlight the region we defined as "math"
hi link math Statement

let g:vim_markdown_math = 1

