"======================================================================
"
" init-tabsize.vim - 大部分人对 tabsize 都有自己的设置，改这里即可
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 22:05:44
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" 默认缩进模式（可以后期覆盖）
"----------------------------------------------------------------------

" =============================================================
"                           tab键设置
" =============================================================
set expandtab                               "tab自动转换空格
set softtabstop=4                           "使得按退格键时可以一次删掉 4 个空格
set tabstop=4                               "设定tab长度为4
set shiftwidth=4                            "设定 << 和 >> 命令移动时的宽度为 4
"set autoindent                             "设定自动缩进

" " 设置缩进宽度
" set sw=4
" 
" " 设置 TAB 宽度
" set ts=4
" 
" " 禁止展开 tab (noexpandtab)
" set noet
" 
" " 如果后面设置了 expandtab 那么展开 tab 为多少字符
" set softtabstop=4


augroup PythonTab
	au!
	" 如果你需要 python 里用 tab，那么反注释下面这行字，否则vim会在打开py文件
	" 时自动设置成空格缩进。
	"au FileType python setlocal shiftwidth=4 tabstop=4 noexpandtab
augroup END


