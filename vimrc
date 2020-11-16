" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

if version >= 703
    set colorcolumn=80
endif

if version >= 800
    set tags=./tags;,tags
    " ============ Plugins ===========
    call plug#begin('~/.vim/plugged')
    " runtime-ctag
    Plug 'ludovicchabant/vim-gutentags'
    " runtime-linting
    Plug 'dense-analysis/ale'
    " todo.txt support
    Plug 'https://github.com/freitass/todo.txt-vim.git'
    call plug#end()
    " ============ Plugins ===========
endif


" ================ Plugin Specific Config ====================

" Gutentags is a plugin that takes care of the much needed
" management of tags files in Vim. It will (re)generate tag files as you work
" while staying completely out of your way. It will even do its best to keep
" those tag files out of your way too. It has no dependencies and just works.
" gutentags stop at project root
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project', '.XR_WSROOT']
" generate tags file
let g:gutentags_ctags_tagfile = 'tags'

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
" checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your
" text files, and acts as a Vim Language Server Protocol client.
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_sign_error = "\ue009\ue009"
hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta



" ================ General Config ====================
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins
let mapleader=","

" =============== Vundle Initialization ===============
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ================ Cursor control ===================
set cursorline  
set cursorcolumn

" ================ Color and UI =====================
set background=dark " we are using a dark background
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2 " always show the status line

" ================ Turn Off Swap Files ==============
" set noswapfile
" set nobackup
" set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set cindent
set fo=tcrqn

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:>-,trail:-
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

set report=0 " tell us when anything is changed via :...
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set cmdheight=1 " the command bar is 2 high
set ruler " Always show current positions along the bottom

set lsp=0 " space it out a little more (easier to read)
set clipboard+=unnamed " turns out I do like is sharing windows clipboard
set ffs=unix,dos,mac " support all three, in this order
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,-

" ================ Folds ============================
"set foldmethod=indent   "fold based on indent
"set foldnestmax=3       "deepest fold is 3 levels
"set nofoldenable        "dont fold by default
"set foldlevel=100       "Don't autofold anything (but I can still fold manually)
"set foldopen-=search    "don't open folds when you search into them
"set foldopen-=undo      "don't open folds when you undo stuff

" ================ Completion =======================
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" =============== Formatting =======================

set showmatch
set mat=5 " how many tenths of a second to blink matching brackets for


" ================ New feature ======================

" set spell
set sm
set noic

" Set color coloumn on specific files "
if version >= 703
    set colorcolumn=80
endif

