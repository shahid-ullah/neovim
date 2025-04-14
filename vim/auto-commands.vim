" Highlight trailing whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

""" configuration for full stack developemnt
au BufNewFile,BufRead *.js,*.html,*.css,*vim
      \ set expandtab |
      \ set tabstop=2 |
      \ set shiftwidth=2 |
      \ set softtabstop=2 |
      \ set colorcolumn=90 |

augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END


autocmd FileType htmldjango set expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType htmldjango inoremap {{ {{  }}<left><left><left>
autocmd FileType htmldjango inoremap {% {%  %}<left><left><left>
autocmd FileType htmldjango inoremap {# {#  #}<left><left><left>
autocmd FileType htmldjango setlocal commentstring={#\ %s\ #}

" Markdown and Journal
augroup markdown
  " autocmd FileType  markdown colorscheme gruvbox
  autocmd FileType markdown setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType journal setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup END


augroup highlight_yank
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 100})
augroup END


augroup every
  autocmd!
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
  autocmd InsertEnter * set norelativenumber
  autocmd InsertLeave * set relativenumber
augroup END


" Update a buffer's contents on focus if it changed outside of Vim.
autocmd FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste


augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" set header title for journal & enter writing mode
function! JournalMode()
    execute 'normal gg'
    let filename = '#' . ' ' . expand('%:r')
    call setline(1, filename)
    execute 'normal o'
    " execute 'Goyo'
endfunction

" augroup journal
    " autocmd!

"     " populate journal template
    " autocmd VimEnter */journal/**   0r ~/.config/nvim/templates/journal.skeleton

"     " set header for the particular journal
"     " autocmd VimEnter */journal/**   :call JournalMode()

"     " https://stackoverflow.com/questions/12094708/include-a-directory-recursively-for-vim-autocompletion
"     " autocmd VimEnter */journal/**   set complete=k/Users/danish/programming/mine/journal/**/*
" augroup END
