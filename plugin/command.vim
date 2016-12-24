" Fugitive/Git custom commands
cabbrev Git G
cabbrev Gwrite Gw
cabbrev Gd Gdiff
command! -nargs=* Gco call git#checkout(<q-args>)
