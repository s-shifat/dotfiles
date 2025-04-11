" === Minimal vimrc for remote SSH machines ===

" Set leader key to Space
let mapleader = " "

" === General Options ===
set nocompatible
set number                   " Show absolute line numbers
set relativenumber           " Relative line numbers
set tabstop=4                " Number of spaces a <Tab> counts for
set shiftwidth=4             " Number of spaces for each indent
set expandtab                " Use spaces instead of tabs
set autoindent               " Auto-indent new lines
set smartindent              " Smarter autoindenting
set ignorecase               " Case-insensitive search...
set smartcase                " ...unless capital letters used
set incsearch                " Show matches as you type
set hlsearch                 " Highlight matches
set cursorline               " Highlight current line
set wrap                     " Wrap long lines
set scrolloff=8              " Keep 8 lines above/below cursor
set sidescrolloff=8          " Keep 8 columns left/right
set clipboard=unnamedplus    " Use system clipboard if available
set mouse=a                  " Enable mouse
set hidden                   " Switch buffers without saving
set updatetime=300           " Faster CursorHold trigger
set splitright               " Vertical split to the right
set splitbelow               " Horizontal split below

" === Performance Boosts for SSH ===
set ttyfast
set lazyredraw
set noswapfile
set nobackup
set nowritebackup

" === Status Line & Display ===
set laststatus=2
set showcmd
set ruler

" === Insert Mode Escape ===
inoremap jj <Esc>

" === Split Navigation with Ctrl + hjkl ===
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>


" === Leader Key Shortcuts ===
nnoremap <Leader>w :w<CR>           " Save and quit all
nnoremap <Leader>wq :wqall<CR>           " Save and quit all
nnoremap <Leader>c :wq<CR>              " Save and quit current buffer
nnoremap <Leader>q :q<CR>               " Quit current window
nnoremap <Leader>x :x<CR>               " Save and quit
nnoremap <Leader>h :noh<CR>             " Clear search highlight
nnoremap <Leader>r :source $MYVIMRC<CR> " Reload vimrc


" === Resize splits using Ctrl + Arrow Keys ===
nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>


" === Syntax & Filetype ===
filetype plugin indent on
syntax on

" === Clipboard fallback ===
if has('clipboard')
  set clipboard=unnamedplus
endif

" === Toggle netrw file explorer with fixed width ===
function! ToggleNetrw()
  for w in range(1, winnr('$'))
    if getbufvar(winbufnr(w), '&filetype') ==# 'netrw'
      exec w . 'wincmd c'
      return
    endif
  endfor
  Lexplore
  vertical resize 25
endfunction
nnoremap <Leader>e :call ToggleNetrw()<CR>


set tabline=%!BufTabLine()
function! BufTabLine()
  let s = ''
  for i in range(1, bufnr('$'))
    if buflisted(i)
      let name = bufname(i) == '' ? '[No Name]' : fnamemodify(bufname(i), ':t')
      let s .= (i == bufnr('%') ? '%#TabLineSel#' : '%#TabLine#')
      let s .= '%' . i . 'T ' . name . ' '
    endif
  endfor
  let s .= '%#TabLineFill#%T'
  return s
endfunction
set showtabline=2

