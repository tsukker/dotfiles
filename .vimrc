if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=/Users/shunsuke/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/Users/shunsuke/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.git'

call neobundle#end()

filetype off
filetype plugin indent off

" ##### prefernce of displaying #####
set number " number of line
set title " filename of current
set showmatch " kakko

let g:solarized_termtrans=1
syntax on " coloring
set background=dark
colorscheme solarized

set expandtab " use space instead tab
" set tabstop=2 " 2-tab
set shiftwidth=2
set smartindent " indent based on the last part of the previous line
" set autoindent " indent as the same as the previous line


" ##### prefernce of search #####
set ignorecase " ignore difference between UPPER and lower
set smartcase " NOT ignore only if including UPPER
" set wrapscan " back to the first from the last (orikaeshi)

set nowrap " orikaesanai
inoremap <silent> jj <ESC>

nnoremap Q :wq

nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)

" enable :filetype settings
filetype plugin indent on
