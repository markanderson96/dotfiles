syntax on

set showcmd
set showmatch
set autowrite
set wrap
set showmode
set number
set autoindent

set hidden
set backspace=indent,eol,start

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" colorscheme gruvbox

" Indent Guide

set ts=4 sw=2 et
let g:indent_guides_start_level = 1

" Auto-open

au VimEnter * NERDTree
au VimEnter * Tagbar

" Mapping

nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TagbarToggle<CR>

" Vim Plugins

call plug#begin('~/.vim/plugins')

Plug 'Valloric/YouCompleteMe'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'


call plug#end()
