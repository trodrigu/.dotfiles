function! neoterm#test#rspec#run(scope)
  let path = g:neoterm_use_relative_path ? expand('%') : expand('%:p')
  let command = 'rspec'

  if a:scope == 'file'
    let command .= ' ' . path
  elseif a:scope == 'current'
    let command .= ' ' . path . ':' . line('.')
  endif

  return command
endfunction
