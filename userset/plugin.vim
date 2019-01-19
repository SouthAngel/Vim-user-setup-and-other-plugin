" Userset
let s:plugin_path=glob("<sfile>:h\\Script\\*", v:true, v:true)
for path in s:plugin_path
	exe "set\ rtp-=".path."\ rtp+=".path
endfor	
unlet s:plugin_path

" PowerLine setup
set laststatus=2

" Completor
let g:completor_python_binary = 'C:\Python27\python.exe'

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-k><C-k>"
let g:UltiSnipsJumpForwardTrigger="<C-k><C-l>"
let g:UltiSnipsJumpBackwardTrigger="<C-k><C-j>"
let g:UltisnipsListSnippets="<C-k><C-i>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" PyMode
" Add paths to `sys.path`                                          *'g:pymode_paths'*
let g:pymode_paths = []
" Setup max line length                        *'g:pymode_options_max_line_length'*
let g:pymode_options_max_line_length = 79
" Enable automatic virtualenv detection                     *'g:pymode_virtualenv'*
let g:pymode_virtualenv = 1
" Set path to virtualenv manually                      *'g:pymode_virtualenv_path'*
let g:pymode_virtualenv_path = $VIRTUAL_ENV

