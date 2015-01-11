"
" Mappings
"

" Leader to comma
let mapleader = ','

" Useful editing mode toggles.
nnoremap <Leader>sl :set list!<CR>
nnoremap <Leader>sw :set wrap!<CR>
nnoremap <Leader>sr :set relativenumber!<CR>
" Bind ss to show the mappings for s mode toggles.
" Will likely remove this once it's muscle memory.
nnoremap <Leader>ss :nnoremap <Leader>s<CR>

" pbpaste / copy
nnoremap <silent> <Leader>P :.!pbpaste<CR>
nnoremap <silent> <Leader>Y :.w !pbcopy<CR><CR>
vnoremap <silent> <Leader>Y :w !pbcopy<CR><CR>

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

" TagBar
nmap <Leader>O :TagbarToggle<CR>

" Gundo
nmap <Leader>U :GundoToggle<CR>

" YankRing
nnoremap <silent> <Leader>p :YRShow<CR>1b1b1b

" CtrlP
let g:ctrlp_extensions = ['tag', 'changes']
nnoremap <Leader>t :CtrlPBuffer<CR>
nnoremap <Leader>T :CtrlP<CR>
nnoremap <Leader>r :CtrlPTags<CR>

" Buffer closing
nnoremap <Leader>q :Bdelete<CR>

