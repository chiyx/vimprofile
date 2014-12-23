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
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin('~/.vim/vundle')
    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    "括号自动补全插件
    Plugin 'Raimondi/delimitMate'

    call vundle#end()   "required
    filetype plugin on
    filetype plugin indent on   "required

"}
    




