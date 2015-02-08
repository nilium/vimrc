" vim: ts=8 sw=8 noet:
" cdbuf.vim
" Noel Cower
"
" Plugin to CD to the directory of the current buffer.
"
" If g:cdbuf_global is set to a non-zero value, :CD will always change the
" global PWD instead of just the window's PWD.

if !exists('g:cdbuf_global')
        let g:cdbuf_global = 1
endif

function s:CDToBuf(bang)
        let l:global_cd = g:cdbuf_global
        if exists('b:cdbuf_global')
                let l:global_cd = b:cdbuf_global
        endif

        let l:global_cd = l:global_cd || bang == '!'

        if l:global_cd
                normal! cd %:p:h
        else
                normal! lcd %:p:h
        endif
endfunction

command! -bang CD :call <SID>CDToBuf("<bang>")

