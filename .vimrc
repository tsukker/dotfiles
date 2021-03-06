if has('vim_starting')
"  if &compatible
"    set nocompatible               " Be iMproved
"  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc.git'

call neobundle#end()

filetype off
filetype plugin indent off

" ##### prefernce of displaying #####
set number " number of line
set title " filename of current
set showmatch " brackets
" set nowrap " don't wrap lines
" set wrapscan " wrap lines

let g:solarized_termtrans=1
set background=dark
colorscheme solarized
syntax on " coloring

set backupskip=/tmp/*,/private/tmp/*

" ##### preference of indent #####
set expandtab " use space instead tab
" set tabstop=2 " 2-tab
set shiftwidth=2
set smartindent " indent based on the last part of the previous line
" set autoindent " indent as the same as the previous line
set cinoptions+=:0,g0


" ##### prefernce of search #####
set ignorecase " ignore difference between UPPER and lower
set smartcase " NOT ignore only if including UPPER
set incsearch " Incremental search

" ##### preference of mouse use #####
" set mouse=a

" ##### my unique settings #####
inoremap <silent> jj <ESC>
" inoremap <silent> jj <ESC>:<C-u>w<CR>
nnoremap Q :wq

nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

command! C call s:C()
nmap <F5> :C<CR>
function! s:C()
  :w
  :!clang++ -std=c++17 -O2 -Wall -Wextra -o x %
:endfunction

nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" enable :filetype settings
filetype plugin indent on

