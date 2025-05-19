let mapleader = " "

set nocompatible
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline
set wrap
set scrolloff=8
set sidescrolloff=8
set clipboard=unnamedplus
set mouse=a
set hidden
set updatetime=300
set splitright
set splitbelow
set ttyfast
set lazyredraw
set noswapfile
set nobackup
set nowritebackup
set laststatus=2
set showcmd
set ruler

inoremap jj <Esc>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap H :bprevious<CR>
nnoremap L :bnext<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wqall<CR>
nnoremap <Leader>c :wq<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>h :noh<CR>
nnoremap <Leader>r :source $MYVIMRC<CR>

nnoremap <C-Up>    :resize -2<CR>
nnoremap <C-Down>  :resize +2<CR>
nnoremap <C-Left>  :vertical resize -2<CR>
nnoremap <C-Right> :vertical resize +2<CR>

filetype plugin indent on
syntax on

if has('clipboard')
  set clipboard=unnamedplus
endif

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

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

highlight Normal       ctermfg=189 ctermbg=NONE  cterm=NONE
highlight Comment      ctermfg=108 cterm=italic
highlight Constant     ctermfg=176
highlight String       ctermfg=181
highlight Identifier   ctermfg=182
highlight Function     ctermfg=111
highlight Statement    ctermfg=104 cterm=bold
highlight Keyword      ctermfg=140
highlight Type         ctermfg=110
highlight Special      ctermfg=174
highlight PreProc      ctermfg=143
highlight Todo         ctermfg=223 ctermbg=NONE cterm=bold

highlight LineNr       ctermfg=243
highlight CursorLineNr ctermfg=189 cterm=bold
highlight CursorLine   cterm=NONE ctermbg=236
highlight Visual       ctermbg=238
highlight Search       ctermfg=0   ctermbg=221
highlight MatchParen   ctermfg=NONE ctermbg=244 cterm=bold

highlight StatusLine   ctermfg=255 ctermbg=239 cterm=bold
highlight VertSplit    ctermfg=239 ctermbg=NONE cterm=NONE
highlight TabLine      ctermfg=244 ctermbg=233
highlight TabLineSel   ctermfg=255 ctermbg=240 cterm=bold
highlight TabLineFill  ctermfg=233 ctermbg=233
