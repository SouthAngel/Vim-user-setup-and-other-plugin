"Plug {{{1"
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-git', {'on': 'G'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'gregsexton/gitv'
Plug 'terryma/vim-multiple-cursors'
" Plug 'ervandew/supertab'
Plug 'dense-analysis/ale'
" Plug 'SpaceVim/SpaceVim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'
Plug 'justinmk/vim-sneak'
Plug 'mattn/emmet-vim'
" Plug 'autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }

Plug 'maralla/completor.vim'
Plug 'kyouryuukunn/completor-necovim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'deoplete-plugins/deoplete-jedi'
" Plug 'davidhalter/jedi'
" Plug 'Shougo/neco-vim'
" if has('win32') || has('win64')
"     Plug 'tbodt/deoplete-tabnine', { 'do': 'powershell.exe .\install.ps1' }
" else
"     Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
" endif
" if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"     Plug 'Shougo/deoplete.nvim'
"     Plug 'roxma/nvim-yarp'
"     Plug 'roxma/vim-hug-neovim-rpc'
" endif
call plug#end()

"App init{{{1"
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set guifont=DejaVu_Sans_Mono_for_Powerline:h10,Hermit:h11,consolas:h11,courier_new:h11
    set guifontwide=courier_new:h12
else
    set fileencoding=utf-8
endif
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8

syntax on
set guioptions=acgh
colorscheme gruvbox
set t_Co=256
set laststatus=2
set lazyredraw
let $PATH=$PATH.";".$VIM."/commands"

"Options {{{1
set nocompatible
set mouse=a
set backspace=indent,eol,start
set foldmethod=indent
set colorcolumn=80
set linespace=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set ruler
set hlsearch
set autoindent
set smartindent
set showcmd
set relativenumber
set wildmode=list:longest
set directory-=.
set hidden
set ignorecase
set smartcase

" Plugin options {{{1

" Gruvbox Plugin {{{2
if has_key(g:plugs, "morhetz/gruvbox")
    hi BufTabLineActive ctermfg=235 ctermbg=246 guifg=#282828 guibg=#a89984
    " hi BufTabLineCurrent ctermfg=246 ctermbg=239 guifg=#a89984 guibg=#504945
    hi! BufTabLineCurrent ctermfg=246 ctermbg=239 guifg=#a89984 guibg=#901010
endif

" Airline Plugin {{{2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#coc#enabled=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_theme='minimalist'
let g:airline#extensions#whitespace#enabled=0
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'

" UltiSnips Plugin {{{2
let g:UltiSnipsExpandTrigger = "<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<c-l>"
let g:UltiSnipsJumpBackwardTrigger = "<c-j>"
let g:UltiSnipsEditSplit = "vertical"
let g:UltiSnipsSnippetDirectories = [ "UltiSnips", "UVSnips", ]

" Deoplete Plugin {{{2
if has_key(g:plugs, "deoplete.nvim")
    let g:deoplete#enable_at_startup = 1
    let g:python_host_prog = "D:\\Python\\Python27\\python.exe"
    let g:python3_host_prog = "D:\\Python\\Python38\\python.exe"
    let g:deoplete#ignore_sources = {'_': ['buffer', 'around']}
    call deoplete#custom#option({
        \ 'auto_complete_delay': 20,
        \ 'smart_case': v:true,
        \ 'skip_multibyte': v:true,
        \ 'yarp': v:true,
        \ })
    call deoplete#custom#option('sources', {
        \ 'cpp': ['LanguageClient'],
        \ 'c': ['LanguageClient'],
        \ 'vim': ['vim'],
        \ 'zsh': ['zsh']
        \})
    call deoplete#custom#var('tabnine', {
        \ 'line_limit': 500,
        \ 'max_num_results': 20,
        \ })
endif

" Completor Plugin {{{2
if has_key(g:plugs, "completor.vim")
    let g:completor_auto_trigger = 1
    let g:completor_filetype_map = {}
    let g:completor_filetype_map.python = {'ft': 'lsp', 'cmd': 'pyls'}
endif

" Coc.nvim Plugin {{{2
if has_key(g:plugs, "coc.nvim")
    inoremap <silent><expr> <C-C> coc#refresh()
endif

" Ag Plugin {{{2
let g:ag_prg=$VIM."/commands/ag.exe --vimgrep"
let g:ag_working_path_mode="r"

" LanguageClient-neovim Plugin {{{2
if has_key(g:plugs, "LanguageClient-neovim")
    let g:LanguageClient_serverCommands = {
        \'python': ["C:/Users/SouthAngel/AppData/Roaming/Python/Python38/Scripts/pyls.exe"],
        \}
endif

" Keymap {{{1
let mapleader = " "
inoremap <C-BS> <Esc>dawa
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>" 
map! <C-V> <C-R>+
vnoremap / y/<C-R>+<CR>
vnoremap <C-H> ^
vnoremap <C-L> $
nnoremap <C-H> ^
nnoremap <C-L> $
nnoremap <Esc> :
nnoremap www :write<Cr>

vsplit
