if exists("g:projectFolderPath")
    if g:projectFolderPath == ""
        call projectFolder#findufolder(0)
    endif
    if g:projectFolderPath == ""
        exe "cd ".expand("%:p:h")
    else
        if fnamemodify(".", ":p") != g:projectFolderPath
            exe "cd ".g:projectFolderPath
        endif
    endif
endif

