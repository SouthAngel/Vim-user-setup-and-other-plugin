let s:sourcelist = glob($VIM."\\userset\\*.vim", v:true, v:true)
for each in s:sourcelist
    exe "source\ ".each
endfor
unlet s:sourcelist
