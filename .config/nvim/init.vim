call plug#begin('~/.local/share/nvim/plugged')

" Color scheme
Plug 'flazz/vim-colorschemes'

" Status line
Plug 'itchyny/lightline.vim'
let g:lightline={
    \ 'colorscheme': 'solarized',
    \ }

" Style : indent, whitespace, linter
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup=1

Plug 'editorconfig/editorconfig-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'w0rp/ale'

" Auto completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx'

let g:deoplete#sources#clang#libclang_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'
let g:deoplete#enable_at_startup=1
" タブで補完候補を選択できるようにする
inoremap <expr><Tab> pumvisible() ? "\<DOWN>" : "\<Tab>"
inoremap <expr><S-Tab> pumvisible() ? "\<UP>" : "\<S-Tab>"

" Git
Plug 'tpope/vim-fugitive'

" WIP
Plug 'junegunn/fzf'

call plug#end()


"let g:solarized_termtrans=1
"set background=dark
colorscheme solarized
syntax on " syntax highlighting

" ##### prefernce of displaying #####
set number " number of line
set title " filename of current
set showmatch " brackets

" ##### preference of indent #####
set expandtab " use space instead of tabs
set smartindent " indent based on the last part of the previous line
set autoindent " indent as the same as the previous line

" ##### prefernce of search #####
set ignorecase " ignore difference between UPPER and lower
set smartcase " NOT ignore only if including UPPER
set incsearch " Incremental search

" ##### key bindings #####
inoremap <silent> jj <ESC>
" inoremap <silent> jj <ESC>:<C-u>w<CR>
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

