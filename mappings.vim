"
" Mappings
"

set esckeys

" Leader to space.
let mapleader = ' '

" Unite stuff
nnoremap <Leader>ko :Unite -start-insert file_rec/async<CR>
nnoremap <Leader>kf :Unite -start-insert grep<CR>
nnoremap <Leader>kr :Unite -start-insert register<CR>
nnoremap <Leader>ks :Unite -start-insert ultisnips<CR>
nnoremap <Leader>kk :UniteResume<CR>
nnoremap <Leader>kR <Plug>(unite_restart)

" Clear search.
nnoremap <Leader><Leader> :nohlsearch<CR>:echo ''<CR>

" Folding
nnoremap <silent> <Leader><CR> za

" Window nav
nnoremap <Leader>w <C-w>

" Leader to comma
let mapleader = ","

" Switch buffers
nnoremap <silent> <Leader>bn :bnext<CR>
nnoremap <silent> <Leader>bp :bprev<CR>
" Use count to switch buffers. If no count provided or <= zero, use :ls.
nnoremap <silent> <expr> <Leader>b (v:count > 0 ? ':b'.v:count : ':ls').'<CR>'
nnoremap <silent> <Leader>ls :ls<CR>

" Useful editing mode toggles.
nnoremap <silent> <Leader>sl :set list!<CR>
nnoremap <silent> <Leader>sw :set wrap!<CR>
nnoremap <silent> <Leader>sr :set relativenumber!<CR>
" Bind ss to show the mappings for s mode toggles.
" Will likely remove this once it's muscle memory.
nnoremap <silent> <Leader>ss :nnoremap <Leader>s<CR>
nnoremap <silent> <Leader>so :ZoomToggle<CR>
nnoremap <silent> <Leader>sd :NERDTreeToggle<CR>

" Display <Leader> mappings
nnoremap <silent> <Leader><Leader>? :map ,<CR>

" pbpaste / copy
nnoremap <silent> <Leader><Leader>p :let @p=system("pbpaste")<CR>"pp
nnoremap <silent> <Leader><Leader>P :let @p=system("pbpaste")<CR>"pP
nnoremap <silent> <Leader><Leader>Y :.w !pbcopy<CR><CR>
vnoremap <silent> <Leader><Leader>Y :w !pbcopy<CR><CR>

" Move up / down between lines.
" Do not remap home or end, as those should always refer to the end of line.
" Intended to get slightly more natural editing regardless of wrapping.
inoremap <buffer> <silent> <Up>   <C-o>gk
inoremap <buffer> <silent> <Down> <C-o>gj
vnoremap <buffer> <silent> <Up>   gk
vnoremap <buffer> <silent> <Down> gj
nnoremap <buffer> <silent> <Up>   gk
nnoremap <buffer> <silent> <Down> gj

" Imitate Emacs's to-start/end-of-line keys
" No, I don't care that using C-a and C-e isn't idiomatic vim.
inoremap <silent> <C-e> <C-o>g$
inoremap <silent> <C-a> <C-o>g^
nnoremap <silent> <C-a> g^
nnoremap <silent> <C-e> g$
onoremap <silent> <C-a> g^
onoremap <silent> <C-e> g$
vnoremap <silent> <C-a> g^
vnoremap <silent> <C-e> g$

" Esc-Motion
if exists('g:nil_escmotion') && g:nil_escmotion
	inoremap <silent> <Esc>[D <C-o>b
	inoremap <silent> <Esc>[C <C-o>w
	nnoremap <silent> <Esc>[D b
	nnoremap <silent> <Esc>[C w
	vnoremap <silent> <Esc>[D b
	vnoremap <silent> <Esc>[C e
	nnoremap <silent> <Esc>[1;5D <Plug>CamelCaseMotion_b
	nnoremap <silent> <Esc>[1;5C <Plug>CamelCaseMotion_e
	vnoremap <silent> <Esc>[1;5D <Plug>CamelCaseMotion_b
	vnoremap <silent> <Esc>[1;5C <Plug>CamelCaseMotion_e
endif

" TagBar
nmap <silent> <Leader>O :TagbarToggle<CR>

" Gundo
nmap <silent> <Leader>U :GundoToggle<CR>

" YankRing
nnoremap <silent> <Leader>p :YRShow<CR>1b1b1b

" CtrlP
let g:ctrlp_extensions = ['tag', 'changes']
nnoremap <silent> <Leader>t :CtrlPBuffer<CR>
nnoremap <silent> <Leader>T :CtrlP<CR>
nnoremap <silent> <Leader>r :CtrlPTag<CR>

" Buffer closing
nnoremap <silent> <Leader>q :Bdelete<CR>

" hdot
inoremap :hdot ㆍ

" vim: set ft=vim ts=8 sw=8 tw=79 sts=0 fo=croql noet sta :
