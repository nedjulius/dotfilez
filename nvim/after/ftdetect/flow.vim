au! BufRead,BufNewFile *.js if getline(1) =~ '@flow' || getline(7) =~ '@flow' | set filetype=typescript | endif
au! BufRead,BufNewFile *.flow set filetype=typescript
