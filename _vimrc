"pathogen stuff should go first, to avoid any
"conflicts
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Set the default color scheme
colorscheme twilight

"Set search options
set incsearch
set ignorecase smartcase

"Set up 4 space tabs
set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

"Line numbers
set nu  	"Turn on line numbers
set nuw=5 	"Gutter width

set ruler
set nowrap
"set wrapmargin=3
set lbr
set autoindent

set cpo&vim

set hlsearch

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" get rid of characters in window separators
set fillchars=""

syntax on
filetype indent on
autocmd BufNewFile,BufRead *.vb set ft=vbnet
autocmd BufNewFile,BufRead *.ps1 set ft=ps1

"To avoid skipping lines when lines are word wrapped
map <Up> g<Up>
map <Down> g<Down>

set backup writebackup
set backupdir=$HOME\_vim_backups
set directory=$HOME\_vim_swaps

inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"shortcuts for editing/reloading vimrc
nmap <silent> <leader>ev :e ~/_vimrc <Bar> vsp ~/_gvimrc<CR>
nmap <silent> <leader>es :so ~/_vimrc <Bar> :so ~/_gvimrc<CR>

:cd ~

set autochdir

map <A-l> :NERDTreeToggle<CR>
imap <A-l> :NERDTreeToggle<CR>

