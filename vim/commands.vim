" command! -nargs=0 RefreshBackground :lua require('shahid.custom_functions').RefreshBackground()
" command! -nargs=0 HTMLFormatter :lua require('shahid.custom_functions').HTMLFormatter()
command! -nargs=0 RemoveMarks :delm! | delm A-Z0-9


" Easily GREP current word in current file.
command GREP :execute 'vimgrep '.expand('<cword>').' '.expand('%') | :copen | :cc
