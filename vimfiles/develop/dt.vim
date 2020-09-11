" print( log)

function s:t_fun()
    let l:cs = @+
    let l:cs = substitute(l:cs, '^[ "]+|[ "]+$', '', 'g')
    if filereadable(l:cs)
        exe "edit ".l:cs
    else
        echo 'Path is not readable'
    endif
endfunction

call s:t_fun()
