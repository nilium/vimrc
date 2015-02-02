scriptencoding utf-8
set encoding=utf-8
"vim:set ts=8 sw=8 noexpandtab:

"
" Settings
"

" Stick disabled plugins here.
let g:pathogen_disabled = ["vim-airline","vim-bufferline"]

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

" Keep 8 lines of context in window.
set scrolloff=8

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

" Split to the right and down
set splitright splitbelow

" Highlight matching brackets
set showmatch

" Make that backspace key work the way it should
set backspace=indent,eol,start

" Wrapping
set nowrap
set linebreak
let &showbreak='↳ '
if has('patch338')
	set breakindent
endif

" Indentation
set autoindent
set smarttab
" Let the indent plugin handle most of this.
set noexpandtab
set shiftwidth=8
set tabstop=8
let &listchars='tab:│·,trail:·,extends:→,precedes:←'
set nolist

" Show line numbers
set number

" Enable the mouse (if supported)
if has('mouse')
	set mouse=a
endif

" Encryption -- use blowfish2
if has('patch-7.4.399')
	set cryptmethod=blowfish2
else
	set cryptmethod=blowfish
endif

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

" Load airline configuration
" I don't remember why I had this in a separate file.
" so $HOME/.vim/airline-conf.vim

" Load lightline configuration
so $HOME/.vim/lightline.vim

" Pretty braces
if exists('RainbowParenthesesToggle')
	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	" Keep square braces disabled for now -- rarely nested.
	"au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces
else " rainbow
	let g:rainbow_active = 1
endif

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1

" ack.vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" NERDTree
let g:NERDTreeWinSize = 44

" buftabline
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1

" ultisnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'

let g:UltiSnipsEditSplit = 'context'


" Load mappings
source $HOME/.vim/mappings.vim

" Load pathogen
execute pathogen#infect()

" Load tabular patterns
au VimEnter source $HOME/.vim/tabular-patterns.vim
