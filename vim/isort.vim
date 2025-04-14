augroup isort
  autocmd!
  autocmd BufWritePre *.py execute ':Isort'
augroup end
