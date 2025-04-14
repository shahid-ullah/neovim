nmap <silent> <leader>vs :Telescope lsp_dynamic_workspace_symbols<CR>
nmap <silent> <leader>vs :Telescope tags<CR>
nmap <silent> <C-t> :Telescope tags<CR>
nmap <silent> <leader>t :Telescope lsp_document_symbols<CR>
nmap <silent> <leader><leader>t :Telescope lsp_dynamic_workspace_symbols<CR>
nmap <silent> <leader>vr :Telescope lsp_references<CR>
" nmap <silent> <leader>fp :Telescope find_files cwd=/home/shahid/brainstorming/<CR>
nnoremap <silent> <leader>f :Telescope find_files<CR>
" nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <C-p> :Telescope find_files<CR>
nnoremap <silent> <leader>b :Telescope buffers<CR>
" nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <leader>vg :Telescope live_grep<CR>
" nnoremap <silent> <c-f> :Telescope grep_string<CR>
" nnoremap <S-t> :Telescope tags<cr>
" nnoremap <silent> <leader>gs :Telescope grep_string<CR>
" nnoremap <silent> <leader>gs :lua require('telescope.builtin').grep_string({word_match='-w'})<CR>
nnoremap <silent> gs :lua require('telescope.builtin').grep_string({word_match='-w'})<CR>
nnoremap <silent> <leader>rr :Telescope resume<CR>
nnoremap <silent> ,r :Telescope resume<CR>
nnoremap <silent> <leader>p :Telescope commands<CR>
" nnoremap <silent> <c-t> :Telescope lsp_dynamic_workspace_symbols<CR>
