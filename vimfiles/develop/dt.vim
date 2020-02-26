" print( log)

function s:t_fun()
    let l:tmpl = []
    for bi in getbufinfo()
        call add(l:tmpl, bi['bufnr'])
    endfor
    echo l:tmpl
endfunction
" lngljgjlin
" fjlnngjjggg()
" leinlekj

" 2,4call s:t_fun("{", "}")
" call s:t_fun("edit", ".vim", "g")
call s:t_fun()
" del
" ln(lnd(log(run(int(grow())))))
" print nel
" print()
