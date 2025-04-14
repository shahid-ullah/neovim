" Toggle quickfix list
function! QuickFix_toggle()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor

  copen
endfunction

nnoremap <silent> <leader>cc :call QuickFix_toggle()<cr>


function TrimEndLines()
  let save_cursor = getpos(".")
  silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

" autocmd BufWritePre * call TrimEndLines()


fun! EmptyRegisters()
  let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
  for r in regs
    call setreg(r, @_)
  endfor
endfun

command! -nargs=0 EmptyRegisters call EmptyRegisters()


lua << EOF
function _G.put(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end
EOF


" Break inserted text into smaller undo units.
for ch in [',', '.', '!', '?', ';', ':']
  execute printf('inoremap %s %s<C-g>u', ch, ch)
endfor
