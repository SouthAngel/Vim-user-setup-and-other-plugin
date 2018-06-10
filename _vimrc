let s:sourcelist = glob($VIM."\\userset\\*.vim", v:true, v:true)
for each in s:sourcelist
    exe "source\ ".each
endfor
unlet each
unlet s:sourcelist
source $VIM\\userset\\dictionary\\complete.vim
