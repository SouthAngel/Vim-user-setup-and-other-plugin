|buffer-variable|    b:	  局部于当前缓冲区。
|window-variable|    w:	  局部于当前窗口。
|tabpage-variable|   t:	  局部于当前标签页。
|global-variable|    g:	  全局。
|local-variable|     l:	  局部于函数。
|script-variable|    s:	  局部于 |:source| 的 Vim 脚本。
|function-argument|  a:	  函数参数 (只限于函数内使用)。
|vim-variable|       v:	  Vim 预定义的全局变量。

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
