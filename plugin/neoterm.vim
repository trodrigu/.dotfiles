let g:neoterm_position = 'horizontal'
let g:neoterm_automap_keys = '<leader>tt'
let g:neoterm_test_status_format = " %s "
let g:neoterm_run_tests_bg = 1
let g:neoterm_use_relative_path = 1
"
" Toggle running tests in background
nnoremap <leader>bg :call NeoTermTestToggle()<cr>


function! NeoTermTestToggle()
  if g:neoterm_run_tests_bg 
    let g:neoterm_run_tests_bg = 0
  else
    let g:neoterm_run_tests_bg = 1
  endif
endfunction

nnoremap <silent> <f10> :call neoterm#test#run("current")<cr>
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>

" run set test lib
nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> <leader>th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>tc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes \| rg <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>
