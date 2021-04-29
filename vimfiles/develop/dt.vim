" print( log)

function! Dtt_fun()
    let l:line = getline(1)
    if l:line=~" *[\[\{]"
        set filetype=json
        echo "match"
    endif
endfunction

call Dtt_fun()
