scriptencoding utf-8

"
" Settings
"

" Turn off compatibility with the old vi
if &compatible
	set nocompatible
endif

" Encoding to utf-8.
set encoding=utf-8

" Stick disabled plugins here.
let g:pathogen_disabled = []

" Mark buffers as hidden instead of abandoned
set hidden

" Timeouts
set timeout ttimeout timeoutlen=300 ttimeoutlen=10

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

" Keep 3 lines of context in window, 5 columns.
" Used to be 8, found I only regularly wanted about 3 lines of context.
set scrolloff=3
set sidescrolloff=5

" Highlight the current line and show the line/col in the status bar.
set cursorline
set ruler

" Programming sanity check
syntax on
filetype plugin indent on

" Death to the audio bell
set visualbell

" Split to the right and down
set splitright splitbelow

" Don't highlight matching brackets on insert.
set noshowmatch

" Ignore stuff
set wildignore=*/node_modules/*,*.so,*.swp,*/.git/*,*.zip,*.dmg,*/*.sparsebundle/*

" Make that backspace key work the way it should
set backspace=indent,eol,start

" Wrapping
set nowrap
set linebreak
set display+=lastline
set colorcolumn=80,120,160
let &showbreak='↳ '
if has('patch-7.4.338')
	set breakindent
endif

" Indentation
set autoindent
set smarttab
set expandtab
set shiftwidth=8
set tabstop=8
set softtabstop=8
let &listchars='tab:│·,trail:·,extends:→,precedes:←,nbsp:·'
set nolist

" Show line numbers
set number
set ruler

" Search-related
set nohlsearch
set incsearch

" Enable the mouse (if supported)
if has('mouse')
	set mouse=a
endif

if has('mouse_sgr')
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

" Encryption -- use blowfish2
if has('cryptv') && v:progname != 'nvim'
	if has('patch-7.4.399')
		set cryptmethod=blowfish2
	else
		set cryptmethod=blowfish
	endif
endif

" Colors / UI-specific things
set lazyredraw
set wildmenu
set showcmd
set showmode
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

" Default formatoptions
set textwidth=79
set formatoptions=crqn1
if has('patch-7.3.541')
	set formatoptions+=j
endif

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
let g:go_auto_type_info = 1

" Use goimports
" NOTE: Semi-broken lately, unsure why.
let g:go_fmt_command = "goimports"

" YankRing
let g:yankring_history_dir = '$HOME/.vim'

" Load lightline configuration
so $HOME/.vim/lightline.vim

" ack.vim
if executable('ag')
	let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" buftabline
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" easymotion
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
let g:EasyMotion_grouping = 1
let g:EasyMotion_use_upper = 1

" ultisnips
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsListSnippets = '<C-x><C-j>'

let g:UltiSnipsEditSplit = 'context'

" SmartIndent (prevent mapping of =)
let g:ctab_disable_checkalign = 1

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|a|swp|\.DS_Store)$',
  \ }

" Load man
runtime ftplugin/man.vim

" Load pathogen
execute pathogen#infect()

let mapleader = ' '

" viminfo / preservatives
set history=1000
set viminfo=!,\"1000,'100,/1000,@1000,:1000,<1000,h,n~/.vim/viminfo
set sessionoptions=buffers,folds,help,sesdir,slash,unix,winsize

" vim: set ft=vim ts=8 sw=8 tw=79 sts=8 fo=n1jcroql noet sta :
