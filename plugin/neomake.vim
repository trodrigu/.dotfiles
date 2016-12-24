aug run_neomake
  au!
  au BufWritePost,BufEnter * Neomake
aug end

let g:neomake_verbose = 0

let g:neomake_error_sign = {
  \ 'text': 'E>',
  \ 'texthl': 'StatusError'
  \ }

let g:neomake_warning_sign = {
  \ 'text': 'W>',
  \ 'texthl': 'StatusWarner'
  \ }

let g:neomake_elixir_mix_maker = {
 \ 'exe': 'mix',
 \ 'arg': ['compile.elixir', '--warnings-as-errors'],
 \ 'errorformat':
 \ '** %s %f:%l: %m,' .
 \ '%f:%l: warning: %m'
 \ }

let g:neomake_elixir_enabled_makers = ['mix']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_javascript_enabled_makers = ['eslint']
