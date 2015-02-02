" vim: ts=8 sw=8 noet:
" stripws.vim
" Noel Cower
"
" Plugin to strip whitespace before saving. Can be disabled globally by setting
" g:should_strip_trailing_ws to 0 or by setting a buffer's
" b:should_strip_trailing_ws to 0 (or 1). The buffer variable always overrides
" the value of the global by virtue of being more specific.

if !exists('g:should_strip_trailing_ws')
        let g:should_strip_trailing_ws = 1
endif

function! StripTrailingWS()
        let l:should_strip = g:should_strip_trailing_ws
        if exists('b:should_strip_trailing_ws')
                let l:should_strip = b:should_strip_trailing_ws
        end

        if !l:should_strip
                return
        end

	let l:pos = getpos('.')
        %s/\s\+$//e
        call cursor(l:pos[1], l:pos[2], l:pos[3])
endfunction

augroup grpStripTrailingWS
autocmd!
autocmd BufWritePre * :call StripTrailingWS()
augroup END

