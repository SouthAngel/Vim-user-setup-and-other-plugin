
function! tools#cpp#switchSHfile()
    let l:ext = expand("%:e")
    let l:tmp = expand("%:p:r")
    if l:ext=="h" 
        let l:tmp.=".cpp"
        if filereadable(l:tmp)
            exe "edit ".l:tmp
        else
            echo "Not found file ".l:tmp
        endif
    elseif l:ext=="cpp"
        let l:tmp.=".h"
        if filereadable(l:tmp)
            exe "edit ".l:tmp
        else
            echo "Not found file ".l:tmp
        endif
    endif
endfunction

