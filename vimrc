"
" Settings
"

" Timeouts
set timeout ttimeout timeoutlen=300 ttimeoutlen=0
set noesckeys

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=2000
set undoreload=10000

" project.vim default
"
" project isn't currently part of this setup, but I'll likely put it
" back in eventually.
let g:proj_window_width = 30

" Highlight the current line and show the line/col in the status bar.
set cursorline
set ruler

" Programming sanity check
syntax on
filetype plugin indent on

" Turn off compatibility with the old vi
set nocompatible

" Death to the audio bell
set visualbell

" Highlight matching brackets
set showmatch

" Make that backspace key work the way it should
set backspace=indent,eol,start

" Wrapping
set nowrap
set linebreak
set breakindent
let &showbreak='↳ '

" Indentation
set autoindent
set smarttab
" Let the indent plugin handle most of this.
set expandtab
set shiftwidth=8
set tabstop=8
let &listchars='tab:→ ,eol:¬'
set nolist

" Show line numbers
set number

" Enable the mouse (if supported)
set mouse=a

" Encryption -- use blowfish2
set cryptmethod=blowfish2

" Colors / UI-specific things
set wildmenu
set t_Co=256
colorscheme triplejelly

" Set GUI font
if has('gui_running')
	" GUI (e.g., mvim) options
	set guioptions=egmrt
	set gfn=PragmataPro:h13
endif

" Tab line and status line
set showtabline=1
set laststatus=2

"
" Filetype-specific settings
"

" make
" In Makefiles, don't expand tabs to spaces, since we need hard tabs
au filetype make set noexpandtab

" go (and vim-go)
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Use goimports
" NOTE: Semi-broken lately, unsure why.
let g:go_fmt_command = "goimports"

" expandtab is on, but tabs still used for indentation.
au filetype go set expandtab
au filetype go set ts=8
au filetype go set sw=8

" YankRing
let g:yankring_history_dir = '$HOME/.vim'

" Load airline configuration
" I don't remember why I had this in a separate file.
so $HOME/.vim/airline-conf.vim

"
" Pretty braces
"
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
" Keep square braces disabled for now -- rarely nested.
"au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Load mappings
source $HOME/.vim/mappings.vim

" Load pathogen
execute pathogen#infect()

