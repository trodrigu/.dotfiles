set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Github wrapper
Plugin 'tpope/vim-fugitive'

Plugin 'L9'

" Command T search plugin
Plugin 'git://git.wincent.com/command-t.git'

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

"Plugin 'terryma/vim-multiple-cursors'
Plugin 'kchmck/vim-coffee-script'

Plugin 'wavded/vim-stylus'

Plugin 'digitaltoad/vim-jade'

Plugin 'chriskempson/base16-vim'

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

Plugin 'junegunn/goyo.vim'

Plugin 'junegunn/limelight.vim'

"Jsx lint
Plugin 'mxw/vim-jsx'

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
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
sy on
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

"Comment the above and set the below for light
"set background=light
highlight LineNr ctermfg=gray ctermbg=NONE

"Toggle vim-numbertoggle
let g:NumberToggleTrigger="<F2>"

"Remap Command T
nmap <leader>t :CommandT<CR>

set clipboard=unnamed

"Disable folding for vim markdown
let g:vim_markdown_folding_disabled=1

"Set up persistent undo
set undofile
set undodir=~/.vim/undodir

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
