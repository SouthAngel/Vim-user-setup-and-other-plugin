function s:t_fun(key)
    let l:key_map = {}
    let l:key_map['vimrc'] = $VIM."/_vimrc"
    let l:key_map['vimtool'] = $VIM."/vimfiles/plugin/tools.vim"
    let l:key_map['vimproject'] = $VIM."/vimfiles/plugin/projectFolder.vim"
    let l:key_map['vimdt'] = $VIM."/vimfiles/develop/dt.vim"
    let l:key_map['tempsurround'] = "~/.vim/plugged/vim-surround/plugin/surround.vim"
    echo l:key_map
    if has_key(l:key_map, a:key)
        exe "edit ".l:key_map[a:key]
    else
        echo "Not key : ".a:key       
    endif
endfunction
" lngljgjlin
" fjlnngjjggg
" leinlekj

" 2,4call s:t_fun("{", "}")
echo s:t_fun('vimrc')
