set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'  " solarized color
"Plugin 'timheap/linters.vim'
Plugin 'scrooloose/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
let g:syntastic_ruby_checkers = ['']
let g:syntastic_quiet_messages = { 'type': 'style' }
set hidden
" Better command-line completion
set wildmenu
" Show partial commands in the last line of the screen
set showcmd

set ignorecase
set smartcase
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

set nostartofline
" Display the cursor position on the last line of the screen or in the status
set ruler
" Always display the status line, even if only one window is displayed
set laststatus=2
" Instead of failing a command bc of unsaved changes ask if you want to save.
set confirm
" Use visual bell instead of beeping when doing something wrong
set visualbell
set t_vb=
" Enable use of the mouse for all modes
set mouse=a
" Set the command window height to 2 lines
set cmdheight=2

set number
syntax enable
set background=dark

let g:solarized_termcolors = 256
colorscheme solarized

let NERDTreeShowHidden=1
" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

set shiftwidth=2
set softtabstop=2
set expandtab
set nohlsearch
set splitright
"------------------------------------------------------------
" Mappings {{{1
"
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
nnoremap <C-L> :nohl<CR><C-L>

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
cabbrev E Explore
