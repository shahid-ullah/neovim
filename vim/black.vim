let g:black_skip_string_normalization = 1

augroup black
  autocmd!
  autocmd BufWritePre *.py silent! execute ':Black'
augroup end

nnoremap <silent> <F9> :Black<CR>
