"解决菜单和控制台消息乱码问题 {
    if g:isGUI
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim
        language messages zh_CN.utf-8
    endif
"}
