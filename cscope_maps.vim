"cscope settting for vim

if has("cscope")
    "use both csope and ctag for 'ctrl-]'
    set cscopetag
    "cscope before ctags
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
        " else add the database pointed to by environment
        " variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    "show message when any other cscope db added
    set cscopeverbose

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    set cscopequickfix=s-,c-,d-,i-,t-,e-

    nmap <silent> <F3> :!find ./ -name "*.h" -o -name "*.c" -o -name "*.cpp" > cscope.file && cscope -bq<cr><cr>
endif
