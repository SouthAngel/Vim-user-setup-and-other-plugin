if exists('s:loaded')
    finish
endif
let s:loaded = 1

function! tools#test()
    echo 'test function'
endfunction

function! tools#reloadEditor()
    let l:cfile = expand("%:p")
    let l:buffn = bufnr("%")
    write
    new
    exe "bdelete ".l:buffn
    exe "!start gvim \"".l:cfile."\""
    quit
endfunction

function! tools#openInitFile()
    exe "edit ".$VIM."/_vimrc"
endfunction

function! tools#sourceCurrent()
    write
    if !exists("g:eval_prefix")
    let g:eval_prefix = "source"
    endif
    exe g:eval_prefix." ".expand('%')
endfunction

function! tools#call(fn)
    exe "call tools#".a:fn."()"
endfunction

function tools#openMapFile(key)
    let l:key_map = {
        \'vimrc': $VIM."/_vimrc",
        \'vimtool': $VIM."/vimfiles/plugin/tools.vim",
        \'vimproject': $VIM."/vimfiles/plugin/projectFolder.vim",
        \'vimdt': $VIM."/vimfiles/develop/dt.vim",
        \'tempsurround': "~/.vim/plugged/vim-surround/plugin/surround.vim",
        \}
    if has_key(l:key_map, a:key)
        exe "edit ".l:key_map[a:key]
    else
        echo "Not key : ".a:key       
    endif
endfunction

function tools#autoCloseBrackets()
    let l:bs = "\'\'\"\"()[]{}"
    let l:line = getline(".")
    let l:col = col(".")
    let l:fpos = stridx(l:bs, l:line[l:col-2])
    if l:col > 2 && l:fpos%2 == 0
        call setline(line('.'), l:line[:l:col-2].l:bs[l:fpos+1].l:line[l:col-1:])
    endif
endfunction

function tools#quicklyFix()
    let l:line = getline('.')
    let l:pos = getpos('.')[1:2]
    let l:line_split = [l:line[:l:pos[1]-1], l:line[l:pos[1]:]]
    if match(l:line, 'print') != -1
        let l:nline = substitute(l:line, 'print', 'print(', '').')'
        call setline(l:pos[0], l:nline)        
    endif
endfunction

command! -nargs=1 Tool call tools#call(<f-args>)
command! -nargs=1 OpenMFile call tools#openMapFile(<f-args>)
command! VimSource call tools#sourceCurrent()
command! OpenVimrc call tools#openInitFile()
command! ExplorerView exe "!start explorer ".expand("%:p:h")
command! Gitbash exe "!start \"D:\\Program Files\\Git\\git-bash.exe\""

augroup UVim
    autocmd BufEnter * source <sfile>:p:h:h/events/bufEnter.vim
    autocmd BufEnter vimrc,_vimrc,.vimrc setl foldmethod=marker
    autocmd TextChangedI * call tools#autoCloseBrackets()
    autocmd VimEnter * nested source <sfile>:p:h:h/events/vimEnter.vim
augroup END

nnoremap <C-F5> :call tools#sourceCurrent()<CR>
inoremap <C-Q> <ESC>:call tools#quicklyFix()<CR>a
