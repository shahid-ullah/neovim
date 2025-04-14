" nnoremap <leader>vpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>
" nnoremap <leader>vpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>
" nnoremap <leader>vpc <cmd>lua require('goto-preview').close_all_win()<CR>
" Only set if you have telescope installed
" nnoremap <leader>vpr <cmd>lua require('goto-preview').goto_preview_references()<CR>

" nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
" nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
" nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
" nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
" nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
" nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
" nnoremap <leader>vll :call LspLocationList()<CR>

imap <silent> <c-p> <Plug>(completion_trigger)
let g:completion_confirm_key = "\<C-y>"
