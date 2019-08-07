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

" Indent Guide

set ts=4 sw=2 et
let g:indent_guides_start_level = 1

" Mapping

nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TagbarToggle<CR>

" Nerdtree Options
let NERDTreeMapOpenInTab='\r'
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists(“s:std_in”) | NERDTree | endif

" Vim Notes directory
:let g:notes_directories = ['~/Documents/Notes']

" Vim Plugins
call plug#begin('~/.vim/plugins')

Plug 'Valloric/YouCompleteMe'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

" Color Scheme

set bg=dark    " Setting dark mode 
colo gruvbox
let g:airline_theme ='gruvbox'
