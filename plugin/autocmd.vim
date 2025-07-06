"aug user_autocmds
"  au!
"  au BufReadPost *
"    \ if !exists('b:open_at_first_line') &&
"    \   line("'\"") > 0 &&
"    \   line("'\"") <= line("$") |
"    \   execute 'normal! g`"' |
"    \ endif
"
"  "Status Line
"  au VimEnter,WinEnter,BufWinEnter,FileType,BufUnload,VimResized *
"    \ call statusline#update()
"
"  au BufReadPost fugitive://* set bufhidden=delete
"aug END
