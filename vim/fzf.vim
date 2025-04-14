let g:fzf_tags_command = 'ctags -R'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
" let g:fzf_layout = {'up': '~90%', 'window': {'width': 0.8, 'height': 0.8, 'yoffset': 0.5, 'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp'}}
let $FZF_DEFAULT_COMMAND="rg --files --hidden"
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'layout': 'default' } }
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'default': v:true, 'yoffset': 1.0 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout default --info inline --margin=1,4"
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" Empty value to disable preview window altogether
" let g:fzf_preview_window = []
" let $FZF_DEFAULT_OPTS = '--layout=reverse --bind ctrl-a:select-all --info=inline'

" Customize fzf colors to match your color scheme
let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }

" nmap <silent> <Leader>t :Telescope current_buffer_tags<CR>
" nmap <silent> <Leader>t :Telescope lsp_document_symbols<CR>
nmap <silent> ,t :BTags<CR>
" nmap <silent> <S-t> :Telescope tags<CR>
nmap <silent> ,,t :Tags<CR>
nmap <silent> ,m :Marks<CR>
nmap <silent> <leader>; :History:<CR>
nmap <silent> <leader>/ :History/<CR>

" if executable('ag')
"   " Use ag over grep "
"   set grepprg=ag\ -w\ --nogroup\ --nocolor\ --column
"   command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"   nnoremap <leader>g :Ag<SPACE>
" endif

" Get text in files with Rg
" command! -bang -nargs=* Rg
"       \ call fzf#vim#grep(
"       \   'rg -w --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"       \   fzf#vim#with_preview({'options': ['--layout=default', '--info=inline']}), <bang>0)

nnoremap <C-g> :Rg<CR>


" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, {'options': ['--layout=default', '--info=inline', '--preview', 'bat {}']}, <bang>0)


" command! -bang -nargs=* BTags call fzf#vim#buffer_tags(<q-args>, {'options': ['--layout=default']}, <bang>0)

" command! -bang -nargs=* BTags call fzf#vim#buffer_tags(<q-args>, { 'options': ['--layout=default', '--info=inline'] }, <bang>0)

" command! -bang -nargs=* BTags  call fzf#vim#buffer_tags(<q-args>, fzf#vim#with_preview({ "placeholder": "{2}:{3..}", "--layout": "reverse" }), <bang>0)
