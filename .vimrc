set number

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/vim/plugged')  
  Plug('roosta/vim-srcery') 
  Plug('scrooloose/nerdtree') 
  Plug 'scrooloose/syntastic' 
  Plug 'bling/vim-airline' 
  Plug 'easymotion/vim-easymotion' 
  Plug 'valloric/youcompleteme' 
  Plug 'junegunn/fzf' 
  "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 
  Plug 'godlygeek/tabular' 
  Plug 'haya14busa/incsearch.vim' 
  Plug 'ajmwagar/vim-deus' 
  Plug 'suoto/vim-hdl'  
call plug#end()

"set t_Co=256
"colorscheme deus
colorscheme srcery

noremap <C-s> :w<CR>
noremap <C-q> :q<CR>
noremap <f> <Plug>(easymotion-prefix)

" call fzf#run({'sink': 'tabedit'})

set cc=80

set ts=2
set sw=2
set sts=2
set expandtab
" set incsearch

" Custom keymap
imap <Caps> <Esc>
nmap <Caps> <Esc>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" NERDTree
" map <T> :NERDTree
nmap <S-t> :NERDTree<CR>
set encoding=utf-8

set guifont=Monaco

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" EasyMotion
map <S-p> <Plug>(easymotion-prefix)

cmap w!! w !sudo tee > /dev/null %

