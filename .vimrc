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
" Set vertical split chars
set fillchars+=vert:\ 
" Configure status line
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

" Temporary files
set dir=/tmp/
" Highlight while searching
set hlsearch
set incsearch
" Be smart about case senstive searches
set smartcase
" Switch buffers without saving
set hidden
" No bells
set noerrorbells visualbell t_vb=
" Customize wild ignore to speed up searches
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,.git/*
" Mouse is okay
set mouse=a
" Share GUI clipboard
set clipboard=unnamed

" Leader mappings
let g:mapleader = ","
" General
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eb :vsplit $HOME/.bashrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa!<cr>
" Commentary
nnoremap <leader>, :Commentary<cr>
vnoremap <leader>, :Commentary<cr>
" File searching
nnoremap <leader>f :e<space>
nnoremap <leader>F :vsplit .<cr>
nnoremap <leader>v :vsplit<space>
nnoremap <leader>r :Rg<space>
nnoremap <leader>u :MRU<cr>
" Fugitive
nnoremap <leader>gl :Gbrowse!<cr>
vnoremap <leader>gl :Gbrowse!<cr>

" Space mappings
nnoremap <space><tab> :b#<cr>
" Windows
nnoremap <space>w <C-w>
nnoremap <space>w/ :vsplit<cr>
nnoremap <space>w- :split<cr>
" Abolish
nnoremap <space>s :S/
vnoremap <space>s :S/

" Other mappings
" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" vim:set ft=vim et sw=2:
