set nocompatible              " be iMproved, required
filetype off                  " required

if has('vim_starting')
  " Required:
  set runtimepath+=/Users/$USER/.config/nvim/bundle/neobundle.vim/
endif

"let fullpath='/Users/' . $USER . '/.config/nvim/bundle/neobundle.vim/'
call neobundle#begin(expand('/Users/' . $USER . '/.config/nvim/bundle/neobundle.vim/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'flazz/vim-colorschemes'

" Github wrapper
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Avoid a name conflict with L9
" NeoBundle 'user/L9', {'name': 'newL9'}
NeoBundle 'jeffkreeftmeijer/vim-numbertoggle'

NeoBundle 'groenewege/vim-less'

"Jshint for vim
"Bundle 'wookiehangover/jshint.vim'

"Js syntax
"NeoBundle 'jelera/vim-javascript-syntax'

"Recommended js syntax to use with jsx lint
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'terryma/vim-multiple-cursors'

NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'wavded/vim-stylus'

NeoBundle 'digitaltoad/vim-jade'

NeoBundle 'chriskempson/base16-vim'

NeoBundle 'godlygeek/tabular'
NeoBundle 'plasticboy/vim-markdown'

NeoBundle 'junegunn/goyo.vim'

NeoBundle 'junegunn/limelight.vim'

"Nerd commenter
NeoBundle 'scrooloose/nerdcommenter'

"Rails vim
NeoBundle 'tpope/vim-rails'

"Vim snippets and snip-mate
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

"ES6 snippets
NeoBundle 'isRuslan/vim-es6'

"Mustache/Handlebars mode from vim
NeoBundle 'mustache/vim-mustache-handlebars'

"Integrate ag with vim
NeoBundle 'rking/ag.vim'

"Slim template highlight
NeoBundle 'slim-template/vim-slim'

"Dash doc vim
NeoBundle 'rizzatti/dash.vim'

"Rubocop
NeoBundle 'ngmy/vim-rubocop'

"Folding for RSpec
NeoBundle 'vim-utils/vim-ruby-fold'

"Stack answers
NeoBundle 'james9909/stackanswers.vim'

"Airline
NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'

"Vim devicons
NeoBundle 'ryanoasis/vim-devicons'

"Enhance netrw
NeoBundle 'tpope/vim-vinegar'

"Elm!!
NeoBundle 'lambdatoast/elm.vim'

"Vim solarized
"NeoBundle 'altercation/vim-colors-solarized'

"NeoBundle 'craigmery/vim-autotag'

call neobundle#end()

filetype plugin indent on    " required

NeoBundleCheck

set nu
set t_Co=256
"Search
set ignorecase
set incsearch
set nowrapscan
"Wildmenu
set wildmenu
set wildmode=list:longest,full

"Make 0 not lag that much
set timeout timeoutlen=5000 ttimeoutlen=100

set ruler

"Indentation
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set copyindent

"Status Bar
set laststatus=2
set listchars=tab:▸\ ,eol:¬,trail:.
set history=1000

"Allow copying
set mouse=a 

"Background
"Set both of the following for dark base 16
set background=dark
colorscheme base16-default
"colorscheme solarized
syntax enable

"Comment the above and set the below for light
"set background=light
"highlight LineNr ctermfg=gray ctermbg=NONE

"Toggle vim-numbertoggle
let g:NumberToggleTrigger="<F2>"

"Remap Command T
nmap <leader>t :CommandT<CR>

set clipboard=unnamed

"Disable folding for vim markdown
let g:vim_markdown_folding_disabled=1

"Set up persistent undo
set undofile
set undodir=~/.config/nvim/undodir

"No swap
set noswapfile

"Automatic limelight with goyo
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!

"Mustache abbr
let g:mustache_abbreviations = 1

"Gvimdiff shortcut
map <silent> <leader>2 :diffget 2<CR> :diffupdate<CR>
map <silent> <leader>3 :diffget 3><CR> :diffupdate<CR>
map <silent> <leader>4 :diffget 4<CR> :diffupdate<CR>

"ESC shortcut
imap jj <Esc>

"Ignore node_modules and bower_components with command t
set wildignore+=node_modules
set wildignore+=bower_components

"Integrate ag
"let g:ackprg = 'ag --nogroup --nocolor --column'

if executable('ag')
  " Note we extract the column as well as the file and line number
  set grepprg=ag\ --nogroup\ --nocolor\ --column
  set grepformat=%f:%l:%c%m
endif

nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <LEFT> :cprev<CR>
"Fuzzy finder
set rtp+=/usr/local/opt/fzf

"Nvim environment var
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Rmap the temrianal emulator in neovim
:tnoremap <Leader>e <C-\><C-n>

set nohlsearch

"custom ag name
"let g:ag_working_path_mode="r"
"
"Remap move panes
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

"Make Netrw like Nerd Tree
let g:netrw_liststyle=3

"Devicons with Airline
let g:airline_powerline_fonts=1


command! -nargs=1 Locate call fzf#run(
      \ {'source': 'locate <q-args>', 'sink': 'e', 'options': '-m'})

"remap leader
let mapleader = ","

nnoremap <silent> <Leader>v :call fzf#run({
      \ 'right': winwidth('.') / 2,
      \ 'sink': 'vertical botright split' })<CR>

nnoremap <silent> <Leader>f :call fzf#run({
      \ 'sink': 'edit' })<CR>

"if ! has('gui_running')
  "set ttimeoutlen=10
  "augroup FastEscape
    "autocmd!
    "au InsertEnter * set timeoutlen=0
    "au InsertLeave * set timeoutlen=1000
  "augroup end
"endif

"Remap fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
set foldnestmax=10
set nofoldenable
set foldlevel=1

fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endf

"Shortcut for pry
map <Leader>bi orequire'pry';binding.pry<esc>:w<cr>

"fun! VexOpen(dir)
  "let g:netrw_browse_split=4
  "let vex_width=25

  "execute "Vexplore " . a:dir
  "let t:vex_buf_nr = bufnr("%")
  "wincmd H

  "call VexSize(vex_width)
"endf

"fun! VexClose()
  "let cur_win_nr = winnr()
  "let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  "1wincmd w
  "close
  "unlet t:vex_buf_nr

  "execute (target_nr - 1) . "wincmd w"
  "call NormalizeWidths()
"endf

"fun! VexSize(vex_width)
  "execute "vertical resize" . a:vex_width
  "set winfixwidth
  "call NormalizeWidths()
"endf

"fun! NormalizeWidths()
  "let eadir_pref = &eadirection
  "set eadirection=hor
  "set equalalways! equalalways!
  "let &eadirection = eadir_pref
"endf

""Make v open widths even
"augroup NetrwGroup
  "autocmd! BufEnter * call NormalizeWidths()
"augroup END

""Map toggle function
"noremap <Leader><Tab> :call VexToggle(getcwd())<CR>
"noremap <Leader>` :call VexToggle("")<CR>

""Make netrw better
"let g:netrw_liststyle=0
"let g:netrw_banner=0
"let g:netrw_altv=1
"let g:netrw_preview=1

"Test helpers
function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader>r :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>. :call RunNearestTest()<cr>
" Run all test files
map <leader>a :call RunTests('spec')<cr>

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w+\) = \(.*\)$let(:\1) { \2 }/
  :normal ==
endfunction
:command! PromoteToLet :call PromoteToLet()
:map <leader>p :PromoteToLet<cr>

" Dash mapping
:nmap <silent> <leader>d <Plug>DashSearch
