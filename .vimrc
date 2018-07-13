" benjavim - step into the vimzone
" Maintainer:   Ben Hayden <https://deybhayden.me/>
" Version:      0.1

" Set colorscheme and other UI tweaks
set background=dark
colorscheme solarized

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

" Space mappings
nnoremap <space><tab> :b#<cr>
nnoremap <space>w <C-w>

" vim:set ft=vim et sw=2:
