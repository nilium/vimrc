"
" Colorscheme: Tripoly for airline, a fork of kalisi. Inspired by powerline.
"

" Visual mode
let s:V1 = [ '#0087ff' , '#fdfdfd','33','231']
let s:V2 = [ '#005faf' , '#5fafff','25','75']
let s:V3 = [ '#87d7ff' , '#005faf','117','25']

" Replace mode
let s:R1 = [ '#5f005f' , '#fdfdfd','53','231']
let s:R2 = [ '#5f005f' , '#df5fff','53','171']
let s:R3 = [ '#ffafff' , '#5f0000','219','52']

let g:airline#themes#tripoly#palette = {}


function! airline#themes#tripoly#refresh()

  let s:StatusLine = airline#themes#get_highlight('StatusLine')
  let s:StatusLineNC = airline#themes#get_highlight('StatusLineNC')

  " Insert mode
  let s:I1 = [ '#ffffff' , '#e80000','231','160']
  let s:I2 = [ '#ff0000' , '#5f0000','196','52']
  let s:I3 = s:StatusLine

  " Normal mode
  let s:N1 = ['#121212', '#00dfff','233','45']
  let s:N2 = ['#121212' , '#0087ff' , '233','33']
  let s:N3 = s:StatusLine

  " Tabline Plugin
  let g:airline#themes#tripoly#palette.tabline = {
        \ 'airline_tab':    ['#fdfdfd', '#262626','231','23'],
        \ 'airline_tabsel': ['#121212', '#00afff','233','39'],
        \ 'airline_tabtype':['#d0d0d0', '#262626','252','235'],
        \ 'airline_tabfill': s:StatusLine,
        \ 'airline_tabhid': ['#c5c5c5', '#404042','251','238'],
        \ 'airline_tabmod': ['#FFA943', '#57131F','221','52'],
        \ 'airline_tabmod_unsel':  ['#FFA943', '#413235','179','238']
        \ }

  let g:airline#themes#tripoly#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#tripoly#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#tripoly#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#tripoly#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)

  " Inactive Mode
  let s:IA = airline#themes#get_highlight('StatusLineNC')
  let g:airline#themes#tripoly#palette.inactive = airline#themes#generate_color_map(
        \ ['#bcbcbc','#333333','250','236'],
        \ ['#bcbcbc','#252525','250','235'],
        \ ['#bcbcbc','#1e1e1e','250','234']
        \ )
  let g:airline#themes#tripoly#palette.inactive_modified = {
        \ 'airline_c':  ['#ff8700', '#3f1818','208','234'],
        \ }

endfunction

call airline#themes#tripoly#refresh()

if !get(g:, 'loaded_ctrlp', 0)
  finish
endif
let g:airline#themes#tripoly#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(
      \ s:StatusLine,
      \ ['#121212', '#00dfff','233','45'],
      \ [ '#121212' , '#0087ff' , '233','33']
      \)

