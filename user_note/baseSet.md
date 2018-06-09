#### Color
colorscheme badwolf         " awesome colorscheme
syntax enable           " enable syntax processing

#### Tab space
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces

#### Ui config
set number              " show line numbers
set relativenumber    " line numbers relative
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set guifont=Courier\ New:h10      " font used

#### Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

#### Folding
set foldenable          " enable folding
set foldlevelstart=10  
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

#### Used function
expand('%')  "获取当前文件名
expand({expr} [, {nosuf} [, {list}]])				*expand()*
		扩展 {expr} 里的通配符和下列特殊关键字。
		'wildignorecase' 此处适用。

		如果给出 {list} 且为 |TRUE|，返回列表。否则返回的是字符串，且
		如果返回多个匹配，以 <NL> 字符分隔 [备注: 5.0 版本使用空格。但
		是文件名如果也包含空格就会有问题]。

		如果扩展失败，返回空字符串。如果 {expr} 以 '%'，'#' 或 '<' 开
		始，不返回不存在的文件名。详见下。

		如果 {expr} 以 '%'、'#' 或 '<' 开始，以类似于
		|cmdline-special| 变量的方式扩展，包括相关的修饰符。这里是一个
		简短的小结:

			%		当前文件名
			#		轮换文件名
			#n		轮换文件名 n
			<cfile>		光标所在的文件名
			<afile>		自动命令文件名
			<abuf>		自动命令缓冲区号 (以字符串形式出现！)
			<amatch>	自动命令匹配的名字
			<sfile>		载入的脚本文件或函数名
			<slnum>		载入脚本文件行号
			<cword>		光标所在的单词
			<cWORD>		光标所在的字串 (WORD)
			<client>	最近收到的消息的 {clientid}
					|server2client()|
		修饰符:
			:p		扩展为完整的路径
			:h		头部 (去掉最后一个部分)
			:t		尾部 (只保留最后一个部分)
			:r		根部 (去掉一个扩展名)
			:e		只有扩展名

