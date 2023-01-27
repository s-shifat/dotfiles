" General
set noswapfile
set nu
set rnu
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
syntax on

" set 7 lines to the cursors when moving vertically
set so=7

" Ignore case when searching
set ignorecase

" Search highlight controls
set hlsearch
set incsearch

" show matching brackets when
set showmatch

" Let the Plugin begin
call plug#begin()

Plug 'dracula/vim', { 'name': 'dracula' } " dracula theme obviously!
Plug 'https://github.com/vim-airline/vim-airline' " status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview

call plug#end()


" == General keymaps ==

" jj to escape
inoremap jj <Esc> 
" leader key to space
let mapleader=" "

" == General keymaps Ends ==


" == Colorscheme Dracula ==
colorscheme dracula
highlight  Normal ctermbg=none
highlight  NonText ctermbg=none
" == Colorscheme Ends ==


" == Airline settings ==

" powerline settings
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" == Airline Ends ==
