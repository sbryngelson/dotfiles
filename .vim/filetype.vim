if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.mako setfiletype mako
    au! BufRead,BufNewFile .*rc setfiletype bash
augroup END
