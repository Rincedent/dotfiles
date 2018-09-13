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
  " Plug 'junegunn/fzf'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'godlygeek/tabular'
  Plug 'haya14busa/incsearch.vim'
  " Plug 'haya14busa/incsearch-easymotion.vim' " Breaks the d/[Char] function
  Plug 'suoto/vim-hdl'
  Plug 'majutsushi/tagbar'
  Plug 'xolox/vim-easytags'
  Plug 'xolox/vim-misc'

call plug#end()

colorscheme srcery

noremap <C-s> :w<CR>
noremap <C-q> :q<CR>

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
cmap w!! w !sudo tee > /dev/null %

" ----------------------------------------------------------------------------
" Incsearch
"
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)

function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
      \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
      \   'keymap': {
      \     "\<CR>": '<Over>(easymotion)'
      \   },
      \   'is_expr': 0
      \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> /  incsearch#go(<SID>incsearch_config())
noremap <silent><expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
noremap <silent><expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))
" ----------------------------------------------------------------------------

" NERDTree
nmap <S-t> :NERDTree<CR>
set encoding=utf-8

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
nmap s <Plug>(easymotion-bd-w)
nmap <S-S> <Plug>(easymotion-sn)

let g:syntastic_vhdl_checkers = ['vimhdl']


" TAGBAR

nmap <F8> :TagbarToggle<CR>
let g:airline#extensions#tagbar#enabled = 0
let g:tagbar_type_vhdl = {
    \ 'ctagstype': 'vhdl',
    \ 'kinds' : [
      \'d:prototypes',
      \'b:package bodies',
      \'e:entities',
      \'a:architectures',
      \'t:types',
      \'p:processes',
      \'f:functions',
      \'r:procedures',
      \'c:constants',
      \'T:subtypes',
      \'r:records',
      \'C:components',
      \'P:packages',
      \'l:locals',
      \'s:signals'
  \]
\}

" EASYTAGS
" Doc : :UpdateTags -R .
let g:easytags_languages = {
      \ 'vhdl': {
        \ 'cmd': 'ctags -R .',
        \ 'recurse_flag': ''
        \   }
        \}
let g:easytags_file = 'vimtags'
nnoremap <S-T> <C-w><C-]><C-w>T


