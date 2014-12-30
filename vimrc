"判断操作系统是否是 Windows 还是 Linux
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif
"判断是终端还是 Gvim
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
set nocompatible
set t_Co=256
set background=dark
colorscheme xoria256
set fencs=utf-8,gbk,gb2312
set noswapfile
set nu
set ruler
set shiftwidth=4
set softtabstop=4
set expandtab
set cindent
syntax on
"保存快捷键
map <c-s> :w<cr>
imap <c-s> <c-o>:w<cr>

"Vundle插件管理 {
    filetype off    "required
    "set the runtime path to include Vundle and initialize
	if g:islinux
		set rtp+=~/.vim/bundle/vundle_vim
		call vundle#begin('~/.vim/vundle')
	else
		set rtp+=$VIM/vimfiles/bundle/vundle_vim/
		call vundle#begin('$VIM/vimfiles/vundle')
	endif
	
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    "括号自动补全插件
    Plugin 'Raimondi/delimitMate'

    call vundle#end()   "required
    filetype plugin on
    filetype plugin indent on   "required

"}
    




