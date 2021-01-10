if exists("b:loaded_ftplugin")
   finish
endif

let b:loaded_ftplugin=1

setlocal tabstop=4
setlocal shiftwidth=4

setlocal foldmethod=marker
setlocal commentstring=;;%s

function! s:IndentLabel()
    let saved_unnamed_register = @@

    if getline('.') =~ "^\s*[a-zA-Z0-9_.]+:$"
        echom "ok"
        normal! V:s/\s+//g
    endif

    let @@ = saved_unnamed_register
endfunction

inoremap <buffer> :normal! all s:IndentLabel()
