" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
let g:ackprg = 'rg -w --vimgrep --type-not sql --smart-case'
" let g:ackprg = 'ag -w --nogroup --nocolor --column'
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif
" Auto close the Quickfix list after pressing '<enter>' on a list item
" let g:ack_autoclose = 1
" Any empty ack search will search for the word the cursor is on
let g:ack_use_cword_for_empty_search = 1
" Don't jump to first match
cnoreabbrev Ack Ack!
" Maps <leader>a so we're ready to type the search keyword
nnoremap <leader>ss :Ack!<Space>
