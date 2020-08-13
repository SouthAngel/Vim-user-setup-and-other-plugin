" print( log)

function s:t_fun()
    let l:ext = expand("%:e")
    let l:tmp = expand("%:p:r")
    if l:ext=="h" 
        let l:tmp.=".cpp"
        if filereadable(l:tmp)
            exe "edit ".l:tmp
        endif
    elseif l:ext=="cpp"
        let l:tmp.=".h"
        if filereadable(l:tmp)
            exe "edit ".l:tmp
        endif
    endif
endfunction
" lngljgjlin
" fjlnngjjggg()
" leinlekj

" 2,4call s:t_fun("{", "}")
" call s:t_fun("edit", ".vim", "g")
" call s:t_fun()
hi! BufTabLineActive ctermfg=235 ctermbg=246 guifg=#282828 guibg=#a10000
hi! BufTabLineCurrent ctermfg=235 ctermbg=246 guifg=#282828 guibg=#a10000
hi! BufTabLineHidden ctermfg=235 ctermbg=246 guifg=#282828 guibg=#a10000
hi! TabLineSel guibg=#a10000
hi! airline_tabsel guibg=#484848

" hi! BufTabLineActive guibg=#a10000
" del
" ln(lnd(log(run(int(grow())))))
" print nel
" print()
