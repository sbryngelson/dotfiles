if exists("did_load_filetypes")
    finish
endif
augroup filetypedetect
    au! BufRead,BufNewFile *.vimrc setfiletype vim
    au! BufRead,BufNewFile *.mako setfiletype mako
    au! BufRead,BufNewFile .*rc setfiletype bash
    au! BufRead,BufNewFile *.fypp setfiletype fortran
    au! BufRead,BufNewFile *.fpp setfiletype fortran
augroup END
