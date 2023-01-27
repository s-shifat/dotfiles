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

call plug#end()


"keymaps
inoremap jj <Esc>

"Colorscheme
colorscheme dracula
highlight  Normal ctermbg=none
highlight  NonText ctermbg=none
