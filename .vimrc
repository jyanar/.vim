" Author: 	Jorge Yanar
" Description:  My personal .vimrc

"
" Vundle Plugins & Settings
"

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Git/GitHub
Plugin 'tpope/vim-fugitive'

" Appearance
Plugin 'bitc/vim-bad-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'junegunn/goyo.vim'

" Navigation
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'

" Syntax
Plugin 'derekwyatt/vim-scala'
Plugin 'tpope/vim-endwise'
Plugin 'plasticboy/vim-markdown'

call vundle#end()
filetype plugin indent on

"
" Vim Configuration
"

" Formatting
set smarttab
set autoindent
set tabstop=4
set shiftwidth=4
set numberwidth=3
set number        " Line numbering
set guifont=Roboto\ Mono\ for\ Powerline:h11
set encoding=utf8
set expandtab     " Tabs -> Spaces!
set textwidth=0   " No autowrapping
set ttyfast       " Assume fast terminal
syntax on

" Highlighting
set number
set showmatch
set hlsearch   " Highlight search
set ignorecase " Case insensitive by default
set incsearch  " Highlight as you type

" Reading
set autoread

" Airline Options
set laststatus=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts=1

" Other plugin options
let g:ctrp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:gitgutter_enabled=0

" Colors
syntax enable
"let g:solarized_termcolors=256
"set background=light
colorscheme zenburn

" Mappings
map <C-N> :NERDTreeToggle<CR>

" ENable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX') " Support resizing in tmux
	set ttymouse=xterm2
endif

" Fix Cursor in TMUX
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"
" Functions
"

function! StripTrailingWhitespace()
    if !&binary && &filetype != 'diff'
        normal mz
        normal Hmy
        %s/\s\+$//e
        normal 'yz<CR>'
        normal `z
    endif
endfunction

