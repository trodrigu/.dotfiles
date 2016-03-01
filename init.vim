set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin('~/.config/nvim/bundle')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Github wrapper
Plugin 'tpope/vim-fugitive'

"Plugin 'L9'

" Command T search plugin
"Plugin 'wincent/command-t'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'jeffkreeftmeijer/vim-numbertoggle'

Plugin 'groenewege/vim-less'

"Jshint for vim
"Bundle 'wookiehangover/jshint.vim'

"Js syntax
"Plugin 'jelera/vim-javascript-syntax'

"Recommended js syntax to use with jsx lint
Plugin 'pangloss/vim-javascript'

Plugin 'terryma/vim-multiple-cursors'
Plugin 'kchmck/vim-coffee-script'

Plugin 'wavded/vim-stylus'

Plugin 'digitaltoad/vim-jade'

Plugin 'chriskempson/base16-vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'junegunn/goyo.vim'

Plugin 'junegunn/limelight.vim'

"Jsx lint
"Plugin 'mxw/vim-jsx'

"Nerd commenter
Plugin 'scrooloose/nerdcommenter'

"Rails vim
Plugin 'tpope/vim-rails'

"Vim snippets and snip-mate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

"ES6 snippets
Plugin 'isRuslan/vim-es6'

"Mustache/Handlebars mode from vim
Plugin 'mustache/vim-mustache-handlebars'

"Integrate ag with vim
Plugin 'rking/ag.vim'

"Slim template highlight
Plugin 'slim-template/vim-slim'

"Dash doc vim
Plugin 'rizzatti/dash.vim'

"Rubocop
Plugin 'ngmy/vim-rubocop'

"Folding for RSpec
Plugin 'vim-utils/vim-ruby-fold'

"Stack answers
Plugin 'james9909/stackanswers.vim'

"Airline
Plugin 'bling/vim-airline'

"Vim devicons
Plugin 'ryanoasis/vim-devicons'

"Enhance netrw
Plugin 'tpope/vim-vinegar'

"Elm!!
Plugin 'lambdatoast/elm.vim'

"Vim solarized
"Plugin 'altercation/vim-colors-solarized'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal see :h vundle for more details or wiki for FAQ Put your non-Plugin stuff after this line syntax enable syntax on
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
