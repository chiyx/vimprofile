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

"调整mapleader {
    let mapleader=','
    noremap \ ,
"}

set t_Co=256
set encoding=utf-8
set fencs=utf-8,gbk,gb2312,latin1
set noswapfile
set nobackup
set shiftwidth=4
set softtabstop=4
set expandtab
set autoread    "当文件变更时自动加载
syntax on

"显示设置 {
    set relativenumber
    set number
    set ruler
    set showcmd
    set showmode
    set showmatch
    set list
    set listchars=tab:▸\ ,trail:▫"
"}

"缩进配置 {
    set smartindent
    set autoindent
"}
"激活内置的插件 {
    runtime macros/matchit.vim
"}

"设置配色主题 {
    syntax enable
    set background=dark
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    "terminal下面的背景问题
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    colorscheme solarized
"    if g:isGUI
"        colorscheme desert
"    else
"        colorscheme xoria256
"    endif
"}

"保存快捷键 {
    map <c-s> :w<cr>
    imap <c-s> <c-o>:w<cr>
"}

"无限undo {
    if has("persistent_undo")
        set undolevels=500
        set undoreload=1000
        set undofile
   endif
"}

"搜索设置 {
    set ignorecase
    set smartcase
    set incsearch
"}
"简化切换窗口焦点快捷键 {
    noremap <C-h> <C-w>h
    noremap <C-j> <C-w>j
    noremap <C-k> <C-w>k
    noremap <C-l> <C-w>l
"}

"Vundle插件管理 {
    filetype off    "required
    "set the runtime path to include Vundle and initialize
    if g:islinux
        set rtp+=~/.vim/bundle/vundle_vim
        call vundle#begin('~/.vim/vundle_plugins')
    else
        set rtp+=$VIM/vimfiles/bundle/vundle_vim/
        call vundle#begin('$VIM/vimfiles/vundle_plugins')
    endif

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'
    "括号自动补全插件
    Plugin 'Raimondi/delimitMate'
    "添加包围的符号
    Plugin 'tpope/vim-surround'
    "支持.对以下插件的重复操作
    "surround.vim
    "speedating.vim
    "abolish.vim
    "unimpaired.vim
    Plugin 'tpope/vim-repeat'
    "通过[前缀了一些常用的命令
    Plugin 'tpope/vim-unimpaired'
    "json高亮插件
    Plugin 'elzr/vim-json'
    "html,css编辑插件
    Plugin 'mattn/emmet-vim'
        "enable in insert and visual mode
        let g:user_emmet_mode='iv'
        "enable just for html,xml,css
        let g:user_emmet_install_global = 0
        autocmd FileType xml,html,css EmmetInstall

    "显示缩进对齐虚线插件
    Plugin 'Yggdroot/indentLine'
        let g:indentLine_char = "┊"
        let g:indentLine_first_char = "┊" 
        let g:indentLine_color_term = 239
        let g:indentLine_color_gui = '#A4E57E'
        nmap <leader>il :IndentLinesToggle<CR>

    "git插件
    Plugin 'tpope/vim-fugitive'

    "一款好看的状态栏插件
    Plugin 'bling/vim-airline'
        set laststatus=2
        let g:airline_symbols = {}
        let g:airline_powerline_fonts = 1
        let g:airline_enable_fugitive=1
        let g:airline_section_c="%t"
        let g:airline_section_x="%y"
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#whitespace#enabled = 0
        let g:airline_left_sep = '»'
        let g:airline_right_sep = '«'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = 'Ý'
        let g:airline_symbols.paste = 'Þ'
        let g:airline_symbols.whitespace = 'Ξ'

    "树形文件列表插件
    Plugin 'scrooloose/nerdtree'
        "当只剩该文件窗口时，关闭vim
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")  && b:NERDTreeType == "primary") | q | endif 
        map <C-n> :NERDTreeToggle<CR>
        let NERDChristmasTree=1
        let NERDTreeShowHidden=1
        let NERDTreeShowLineNumbers=1

    Plugin 'Lokaltog/vim-easymotion'
        let g:EasyMotion_do_mapping = 0 "Disable default mappings
        " Jump to anywhere you want with minimal keystrokes, with just one key binding.
        nmap <Space> <Plug>(easymotion-s)
        " Turn on case sensitive feature
        let g:EasyMotion_smartcase = 1
        " JK motions: Line motions
        map <Leader>j <Plug>(easymotion-j)
        map <Leader>k <Plug>(easymotion-k)

    ".h&.c/.cpp之间切换
    Plugin 'a.vim'

    call vundle#end()   "required
    filetype plugin on
    filetype plugin indent on   "required

"}

"解决菜单和控制台消息乱码问题 {
    if g:isGUI
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif 
"}

