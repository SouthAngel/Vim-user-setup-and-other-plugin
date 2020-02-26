" if exists("s:loaded"):
"   finish
" endif
let s:loaded = 1
let s:__name__ = "!__main__"
let s:projectFolderName = ".uproject"
let g:projectFolderPath = ""

function projectFolder#findufolder(refind)
    let l:ret = g:projectFolderPath
    if a:refind == 1 || g:projectFolderPath == ""
        let l:cpath = expand("%:p:h")
        let l:ret = finddir(s:projectFolderName, l:cpath.";")
        if l:ret != ""
            let l:ret = substitute(fnamemodify(l:ret, ":p"), "\\".s:projectFolderName.".$", "", "")
            let g:projectFolderPath = l:ret
        endif
    endif
    return l:ret
endfunction

function projectFolder#createProjectFolder(...)abort
    let l:ppath = "."
    if a:0 > 0
        let l:ppath = a:1
        exe "cd ".l:ppath
    endif
    call mkdir(fnamemodify(l:ppath."/".s:projectFolderName, ":p"))
    call projectFolder#findufolder(1)
endfunction

function projectFolder#editRunPathFile(mode, macth_suffix, ...)
    let l:run_path = "./.uproject/run"
    if !isdirectory(l:run_path)
        call mkdir(l:run_path)
    endif
    let l:nkey = (a:0 > 0 ? a:1 : "0")
    let l:key_match_files = glob(l:run_path."/".l:nkey."*".a:macth_suffix, v:true, v:true)
    let l:the_file= len(l:key_match_files) > 0 ? l:key_match_files[0] : ""
    if l:the_file == ""
        let l:the_file = l:run_path."/0".a:macth_suffix
        call writefile(["echo \"Run 0\""], l:the_file)
    endif
    exe a:mode." ".l:the_file
endfunction

command ProjectFolderFind call projectFolder#findufolder(1)
command -nargs=? ProjectFolderCreate call projectFolder#createProjectFolder(<f-args>)
command -nargs=? ProjectSourceRun call projectFolder#editRunPathFile("source", ".vim", <f-args>)
command -nargs=? ProjectRunFileEdit call projectFolder#editRunPathFile("edit", ".vim", <f-args>)

noremap <F5> :ProjectSourceRun<CR>

if s:__name__ == "__main__"
    echo "==".projectFolder#findufolder(1)."=="
    echo "==".g:projectFolderPath."=="
endif
