"congiguration: Plugin ale
" install all required packages to global python version that vim was compiled with
" check compiled python version
" :py3 import sys; print(sys.version)

" Check Python files with flake8 and pylint.
" let g:ale_linters = {'python': [], 'javascript': []}
" let g:ale_fix_on_save = 1
" Fix Python files with black, autopep8 and isort.
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \}
"
nnoremap <leader><leader>f :ALEFix<CR>
