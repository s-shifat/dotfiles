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

" Let the Plugin begin
call plug#begin()

Plug 'dracula/vim', { 'name': 'dracula' }

call plug#end()


"keymaps
inoremap jj <Esc>

"Colorscheme
colorscheme dracula
highlight  Normal ctermbg=none
highlight  NonText ctermbg=none
