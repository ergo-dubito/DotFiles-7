" benjavim - step into the vimzone
" Maintainer:   Ben Hayden <https://deybhayden.me/>
" Version:      0.1

" Switch buffers without saving
set hidden
" No bells
set noerrorbells visualbell t_vb=

" Leader mappings
let g:mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Space mappings
nnoremap <space><tab> :b#<cr>
nnoremap <space>w <C-w>

" vim:set ft=vim et sw=2:
