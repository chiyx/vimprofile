"vim prifle
set nocompatible
"引入window版的gvim的的配置
if (g:iswindows && g:isGUI)
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif
"设置gvim的字体和菜单和工具栏 {
    set guifont=monaco:h14
    set guioptions-=m
    set guioptions-=T
    map <silent> <F2> :if &guioptions =~# 'T' <Bar>
            \set guioptions-=T <Bar>
            \set guioptions-=m <Bar>
        \else <Bar>
            \set guioptions+=T <Bar>
            \set guioptions+=m <Bar>
        \endif<cr>
"}

" leader keymap {
    let mapleader=','
    let maplocalleader='-'
    noremap noremap \ ,
"}

" file encoding "{{{
    set enc=utf-8
    set fencs=utf-8,ucs-bom,gb18030,gbk,cp936,latin1
" "}}}

" general "{{{
    set history=256
    set timeoutlen=250
    set clipboard+=unnamed
    set pastetoggle=<F10>
    set shiftround
    set noerrorbells
    set noswapfile
    set nobackup
    set autoread
    set laststatus=2
    set showcmd
    set showmode
    set t_Co=256
    set ttyfast
" "}}}

" visual setting "{{{
    syntax on
    set background=dark
    set cursorline
    set number
    set ruler
    set backspace=indent,eol,start
    " tab indent setting
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set smarttab
    set smartindent
    set autoindent
    " search setting
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set showmatch
    "  display blank
    set list
    set listchars=tab:▸\ ,trail:▫"
" "}}}

"some keymap "{{{
    map <c-s> :w<cr>
    imap <c-s> <c-o>:w<cr>
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
" "}}

" undo setting "{{{
    if has("persistent_undo")
        set undolevels=500
        set undoreload=1000
        set undofile
        set undodir=$VIMFILES/undo
   endif
" "}}}

" colorscheme setting "{{{
    if g:isGUI
        let g:solarized_termtrans=1
        let g:solarized_termcolors=256
        "terminal下面的背景问题
        let g:solarized_contrast="high"
        let g:solarized_visibility="high"
        colorscheme solarized
    else
        let g:molokai_original=1
        let g:rehash256=1
        colorscheme molokai
    endif
    if exists('+colorcolumn')
        set colorcolumn=80
    else
        au BufferWinEnter * let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
    endif
" "}}}

" some local plugin and script "{{{
    runtime macros/matchit.vim
    if g:islinux
        so ~/.vim/cscope_maps.vim
    endif
" "}}}

"ctags配置 {
    if g:islinux
        set tags+=~/.vim/systags
    endif
"}
