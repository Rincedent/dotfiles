if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')

  Plug 'roosta/vim-srcery'
  Plug 'w0rp/ale'
  Plug 'bling/vim-airline'
  Plug 'valloric/youcompleteme', { 'do': './install.py' } 
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'godlygeek/tabular'

call plug#end()

colorscheme srcery

set nocompatible

" autoloads plugins when opening filetypes
filetype plugin on

syntax on
set modelines=0
set number
set cc=80
set ts=2
set sw=2
set sts=2
set expandtab
set sc
set nohlsearch

cmap w!! w !sudo tee > /dev/null %

set encoding=utf-8

nnoremap <C-P> :FZF <CR>
nnoremap <F2> :!ctags -R . <CR>
nnoremap <F3> :!ghdl -i --std=08 $(find * -iname *.vhd) <CR>
 
let g:lt_location_list_toggle_map = '<F5>'
let g:lt_quickfix_list_toggle_map = '<F6>'
nnoremap <F11> :lnext <CR>
 nnoremap <F10> :lprev <CR>
