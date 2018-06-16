noremap <F5> :w<CR>:source %:p<CR>
inoremap <C-z> <Esc>u
nnoremap <C-z> u
nnoremap <C-s> :close<CR>
noremap <C-y> <Esc><C-r>
noremap L $
noremap H ^
vnoremap / y/<C-r>+<CR>

noremap <F3> :call textFunLib#ToggledWith("\#\ ")<CR>
