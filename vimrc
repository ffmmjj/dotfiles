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
Plugin 'gmarik/Vundle.vim'
"
"" Add all your plugins here (note older versions of Vundle used Bundle
"  instead of Plugin)
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'

"" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"" BASICS
syntax on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set pastetoggle=<F2>
set clipboard=unnamed
:imap jk <Esc>


"" CODING
set showmatch   " highlights matching characters [{()}]
set tags=./tags;

"" Python-specific
let python_highlight_all=1
au BufNewFile,BufReadPost *.python setl
      \ tabstop=8 noexpandtab shiftwidth=8 softtabstop=8

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

