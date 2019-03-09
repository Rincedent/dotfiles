if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')

  Plug 'roosta/vim-srcery'
  Plug 'scrooloose/syntastic'
  Plug 'bling/vim-airline'
  Plug 'valloric/youcompleteme', { 'do': './install.py' } 
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'godlygeek/tabular'

call plug#end()

colorscheme srcery
set number
set sc

set cc=80

set ts=2
set sw=2
set sts=2
set expandtab

cmap w!! w !sudo tee > /dev/null %

set encoding=utf-8

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

