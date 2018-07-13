" benjavim - step into the vimzone
" Maintainer:   Ben Hayden <https://deybhayden.me/>
" Version:      0.1

" Set colorscheme and other UI tweaks
set background=dark
colorscheme solarized
" Change cursor shapes in different modes
if has('macunix')
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
  let &t_ti = "\e[1 q"
  let &t_SI = "\e[5 q"
  let &t_EI = "\e[1 q"
  let &t_te = "\e[0 q"
endif

" Highlight while searching
set incsearch
" Be smart about case senstive searches
set smartcase
" Switch buffers without saving
set hidden
" No bells
set noerrorbells visualbell t_vb=

" Leader mappings
let g:mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>, :Commentary<cr>
vnoremap <leader>, :Commentary<cr>

" Space mappings
nnoremap <space><tab> :b#<cr>
nnoremap <space>w <C-w>
nnoremap <space>s :S/
vnoremap <space>s :S/

" vim:set ft=vim et sw=2:
