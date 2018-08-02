" benjavim - step into the vimzone
" Maintainer:   Ben Hayden <https://deybhayden.me/>
" Version:      0.1

" Set colorscheme and other UI tweaks
set background=dark
colorscheme solarized
" Change cursor shapes in different modes
let &t_ti = "\e[1 q"
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_te = "\e[0 q"
" Italic comments
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
" Set vertical split chars
set fillchars+=vert:\ 
" Configure status line
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" Tell GitGutter not to change column colors
let g:gitgutter_override_sign_column_highlight = 0
" Tell Prettier not to autoformat
let g:prettier#autoformat = 0

" Temporary files
set directory=/tmp/
" Highlight while searching
set hlsearch
set incsearch
" Be smart about case senstive searches
set ignorecase
set smartcase
" Switch buffers without saving
set hidden
" No bells
set noerrorbells visualbell t_vb=
" Mouse is okay
set mouse=a
" Share GUI clipboard
set clipboard^=unnamedplus,unnamed
" Set up fzf
if has('macunix')
  set runtimepath+=/usr/local/opt/fzf
  let g:fzf_history_dir = '~/.local/share/fzf-history'
else
  set runtimepath+=~/.fzf
endif

" Leader mappings
let g:mapleader = ','
let g:maplocalleader = '\'

" General
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eb :vsplit $HOME/.bashrc<cr>
nnoremap <leader>ef :e<space>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sp :set spell!<cr>
nnoremap <leader>sn :set number! cursorline!<cr>
nnoremap <leader>sw :set wrap!<cr>
nnoremap <leader>a ggVGy`'
nnoremap <leader>p ggVGp
nnoremap <leader>w :w<cr>
nnoremap <leader>q :qa!<cr>
nnoremap <leader>Q :wqa<cr>
nnoremap <leader>? :Helptags<cr>
nnoremap <leader>sh :helptags ALL<cr>

" Neomake
nnoremap <leader>m :Neomake<cr>
nnoremap <leader>l :lopen<cr>
nnoremap <leader>L :lclose<cr>

" Buffers
nnoremap <space><tab> :b#<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :bd<cr>

" Commentary
nnoremap <leader>, :Commentary<cr>
vnoremap <leader>, :Commentary<cr>

" File searching
nnoremap <leader>f :FZF<cr>
nnoremap <leader>F :FZF<space>
nnoremap <leader>r :Rg<space>
nnoremap <leader>u :FZFMru<cr>
nnoremap <leader>T :Tags<cr>
nnoremap <leader>t :TagbarToggle<cr>

" Git
nnoremap <leader>gg :GitGutter<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gb :Gblame!<cr>
vnoremap <leader>gb :Gblame!<cr>
nnoremap <leader>gl :Gbrowse!<cr>
vnoremap <leader>gl :Gbrowse!<cr>
nnoremap <leader>gs :Gstatus<cr>

" Windows
nnoremap <space>w <C-w>
nnoremap <space>w/ :vsplit<cr>
nnoremap <space>w- :split<cr>

" Abolish
nnoremap <space>s V:S/
vnoremap <space>s :S/

" Buf(Read|Write) Auto Commands
augroup vimrc_group
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
  autocmd BufWritePre *.py Black
  autocmd BufWritePost * GitGutter
  autocmd BufReadPost * call neomake#configure#automake('rw', 1000)
augroup END

" Other mappings

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
" `gx` opens URL in web browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" vim:set ft=vim et sw=2:
