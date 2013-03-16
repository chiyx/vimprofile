set nocompatible
set t_Co=256
set background=dark
colorscheme xoria256
set encoding=utf-8
set tenc=utf-8
set fileencodings=utf-8
set noswapfile
set nobackup
set nu
set ruler
set showcmd
set showmode
set hlsearch
set incsearch
set ignorecase
set smartcase
set cursorline
set showmatch
set noerrorbells
set autoindent
set cindent
set pastetoggle=<F6>
set list
set listchars=tab:>-,trail:-
set shiftwidth=4
set tabstop=4
set expandtab
filetype on
filetype plugin on
filetype indent on
syntax on
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt+=longest
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"代码折叠
autocmd FileType python setlocal foldmethod=indent
"默认情况下不折叠
set foldlevel=99
map <F4> za
"taglist的配置
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"winManager配置,打开目录树和tagList窗口
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
let g:miniBufExplMapCTabSwitchBufs=1
"grep 快捷键映射
nnoremap <silent> <F3> :Rgrep<CR>
"pydiction配置
let g:pydiction_location='~/.vim/dict/complete-dict'
