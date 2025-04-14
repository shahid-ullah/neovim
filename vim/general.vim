let g:python3_host_prog='/usr/bin/python3'
set termguicolors " this variable must be enabled for colors to be applied properly
let g:vimsyn_embed = 'l' "Enable lua code hightlight in vim script

" augroup highlight_yank
"     autocmd!
"     au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
" augroup END
" gruvbox specific
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set fillchars+=vert:\|
set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//

" Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.nvim/undodir

"  copy and pasting from system clipboard
set clipboard+=unnamed

set tags=tags; "Look for a tags file recursively in parent directories

" If linux then set ttymouse
" let s:uname = system("echo -n \"$(uname)\"")
" if !v:shell_error && s:uname == "Linux" && !has('nvim')
"   set ttymouse=xterm
" endif


hi! link QuickFixLine Search
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
nnoremap <S-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <Left> <ScrollWheelLeft>
" nnoremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
" nnoremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
" nnoremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
nnoremap <S-ScrollWheelDown> <ScrollWheelRight>
nnoremap <Right> <ScrollWheelRight>
