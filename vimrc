set nocompatible              " be iMproved, required
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
let g:ycm_auto_trigger = 1   "turn on
let g:ycm_confirm_extra_conf=0
let g:ycm_min_num_of_chars_for_completion = 2  "开始补全的字符数
let g:ycm_python_binary_path = 'python'  "jedi模块所在python解释器路径
let g:ycm_seed_identifiers_with_syntax = 1  "开启使用语言的一些关键字查询
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关闭预览窗口
let g:ycm_complete_in_comments = 1 "在注释输入中也能补全
let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"This line should not be removed as it ensures that various options are
    " properly set to work with the Vim-related packages available in Debian.
     

    " Uncomment the next line to make Vim more Vi-compatible
    " NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous
    " options, so any other options should be set AFTER setting 'compatible'.
    set nocompatible

    " Vim5 and later versions support syntax highlighting. Uncommenting the
    " following enables syntax highlighting by default.



    "设置字符编码
    :set encoding=utf-8
    :set fileencodings=ucs-bom,utf-8,cp936
    :set fileencoding=utf-8
    :set termencoding=utf-8


    if has("syntax")
      syntax on            " 语法高亮
    endif
    colorscheme ron        " elflord ron peachpuff default 设置配色方案，vim自带的配色方案保存在/usr/share/vim/vim72/colors目录下

    " detect file type
    filetype on
    filetype plugin on

    " If using a dark background within the editing area and syntax highlighting
    " turn on this option as well
    set background=dark

    " Uncomment the following to have Vim jump to the last position when
    " reopening a file
    if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
      "have Vim load indentation rules and plugins according to the detected filetype
      filetype plugin indent on
    endif

    " The following are commented out as they cause vim to behave a lot
    " differently from regular Vi. They are highly recommended though.

    "set ignorecase        " 搜索模式里忽略大小写
    "set smartcase        " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。
    set autowrite        " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。
    set autoindent        " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置
    set smartindent        " 智能对齐方式
    set tabstop=4        " 设置制表符(tab键)的宽度
    set softtabstop=4     " 设置软制表符的宽度    
    set shiftwidth=4    " (自动) 缩进使用的4个空格
    set cindent            " 使用 C/C++ 语言的自动缩进方式
    set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s     "设置C/C++语言的具体缩进方式
    set backspace=2    " 设置退格键可用
    set showmatch        " 设置匹配模式，显示匹配的括号
    set linebreak        " 整词换行
    set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去
    set hidden " Hide buffers when they are abandoned
    set mouse=a            " Enable mouse usage (all modes)    "使用鼠标
    set number            " Enable line number    "显示行号
    "set previewwindow    " 标识预览窗口
    set history=50        " set command history to 50    "历史记录50条
    "高亮显示行伟不必要的空白字符
highlight Whitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match Whitespace /\s\+$\ \+/

    "--状态行设置--
    set laststatus=1 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
    set ruler            " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。

    "--命令行设置--
    set showcmd            " 命令行显示输入的命令
    set showmode        " 命令行显示vim当前模式

    "--find setting--
    set incsearch        " 输入字符串就显示匹配点
    set hlsearch   
    set cursorline


"快捷键设置
"
"设置按F2启动NerdTree
map <F2> :NERDTreeToggle<CR>
"设置一键编译
map <F5> :call CompileRunGcc()<CR>
imap <F5> <ESC>:call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    exec "cd %:p:h"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!java %<"
    elseif &filetype == 'sh'
        :!./%
	elseif &filetype == 'python'
        exec "!time python3 %"
	endif
endfunc

" 当新建 .h .c .hpp .cpp .mk .sh .py等文件时自动调用SetTitle 函数
autocmd BufNewFile *.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh,*.py exec ":call SetTitle()"
" 加入注释
func SetComment()
	call setline(1,"/******************************************************************")
	call append(line("."),   "   Copyright (C) ".strftime("%Y")." little_boy. All rights reserved.")
	call append(line(".")+1, "   ")
	call append(line(".")+2, "	      File Name: ".expand("%:t"))
	call append(line(".")+3, "             Author: little_boy")
	call append(line(".")+4, "        Create Time: ".strftime("%Y-%m-%d %H:%M:%S"))
    call append(line(".")+5, "      Last Modified: ".strftime("%Y-%m-%d %H:%M:%S"))
	call append(line(".")+6, "        Description: ---- ")
	call append(line(".")+7, "")
	call append(line(".")+8, "******************************************************************/")
	call append(line(".")+9, "")
	call append(line(".")+10, "")
endfunc
" 加入shell,Makefile,python注释
func SetComment_sh()
	call setline(2, "#================================================================")
	call setline(3, "#   Copyright (C) ".strftime("%Y")." little_boy. All rights reserved.")
	call setline(4, "#   ")
	call setline(5, "#          File Name: ".expand("%:t"))
	call setline(6, "#             Author: little_boy")
	call setline(7, "#        Create Time: ".strftime("%Y-%m-%d %H:%M:%S"))
	call setline(8, "#      Last Modified: ".strftime("%Y-%m-%d %H:%M:%S"))
	call setline(9, "#        Description: ---- ")
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
endfunc
" 定义函数SetTitle，自动插入文件头
func SetTitle()
	if &filetype == 'make'
		call setline(1,"")
		call setline(2,"")
		call SetComment_sh()
	elseif &filetype == 'sh'
		call setline(1,"#!/system/bin/sh")
		call setline(2,"")
		call SetComment_sh()
	else
	     call SetComment()
	     if expand("%:e") == 'hpp'
		  call append(line(".")+10, "#ifndef _".toupper(expand("%:t:r"))."_H")
		  call append(line(".")+11, "#define _".toupper(expand("%:t:r"))."_H")
		  call append(line(".")+12, "#ifdef __cplusplus")
		  call append(line(".")+13, "extern \"C\"")
		  call append(line(".")+14, "{")
		  call append(line(".")+15, "#endif")
		  call append(line(".")+16, "")
		  call append(line(".")+17, "#ifdef __cplusplus")
		  call append(line(".")+18, "}")
		  call append(line(".")+19, "#endif")
		  call append(line(".")+20, "#endif //".toupper(expand("%:t:r"))."_H")
	     elseif expand("%:e") == 'h'
	  	call append(line(".")+10, "#pragma once")
	     elseif &filetype == 'c'
	    call append(line(".")+10, "#include <stdio.h>")
	     elseif &filetype == 'cpp'
	  	call append(line(".")+10, "#include <stdio.h>")
		 elseif &filetype == 'python'
		call setline(1,"")
		call SetComment_sh()
        call setline(13,"#!/system/Bin/python3")
		call setline(14,"# -*- coding: utf-8 -*-")
		call setline(15,"")
		call setline(16,"__author__ == \'little_boy\'")
	     endif
	endif
endfunc
"SET Last Modified Time START
func DataInsert1()
	 call cursor(9,1)
	if search ('Last Modified') != 0
	     let line = line('.')
	     call setline(line, '      Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
	  endif
  endfunc
func DataInsert2()
	 call cursor(9,1)
	if search ('Last Modified') != 0
	     let line = line('.')
	     call setline(line, '#      Last Modified: '.strftime("%Y-%m-%d %H:%M:%S"))
	  endif
  endfunc
autocmd FileWritePre,BufWritePre  *.[ch],*.cpp,*.hpp ks|call DataInsert1() |'s
autocmd FileWritePre,BufWritePre  *.sh,*.py,*.mk,Makefile ks|call DataInsert2() |'s

"SET Last Modified Time END
