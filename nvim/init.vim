" General
set noswapfile
set nu
set rnu
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

" Plugins
call plug#begin()

Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

" set colorscheme
colorscheme dracula
highlight  Normal ctermbg=none
highlight  NonText ctermbg=none


" Key bindings
inoremap jj <Esc>

