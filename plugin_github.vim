" Vundle plugin manager "{{{
    filetype off    " required
    set rtp+=$VIMFILES/bundle/vundle_vim
    call vundle#begin('$VIMFILES/vundle_plugins')

    Plugin 'gmarik/Vundle.vim'
    "括号自动补全插件
    Plugin 'Raimondi/delimitMate'
    "添加包围的符号
    Plugin 'tpope/vim-surround'

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
        map <Leader>w <Plug>(easymotion-w)

    ".h&.c/.cpp之间切换
    Plugin 'a.vim'

    "tagbar
    Plugin 'majutsushi/tagbar'
        nmap <silent> <F2> :TagbarToggle<CR>
        let g:tagbar_type_css = {
                \ 'ctagstype' : 'Css',
                \ 'kinds'     : [
                    \ 'c:classes',
                    \ 's:selectors',
                    \ 'i:identities'
                \ ]
            \ }
        let g:tagbar_type_scala = {
                \ 'ctagstype' : 'Scala',
                \ 'kinds'     : [
                    \ 'p:packages:1',
                    \ 'V:values',
                    \ 'v:variables',
                    \ 'T:types',
                    \ 't:traits',
                    \ 'o:objects',
                    \ 'a:aclasses',
                    \ 'c:classes',
                    \ 'r:cclasses',
                    \ 'm:methods'
                \ ]
            \ }
    "c&cpp语法高亮插件
    Plugin 'vim-jp/cpp-vim'

    call vundle#end()   "required
    filetype on
    filetype plugin on
    filetype plugin indent on   "required

" "}}}
