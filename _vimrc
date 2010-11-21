"pathogen stuff should go first, to avoid any
"conflicts
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"Set the default color scheme
colorscheme twilight
"Set search options

"turn off the bell
set vb t_vb="

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

"stop using the damn arrow keys
inoremap <Left> <NOP>
inoremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

"windowing shortcuts
noremap <C-j> <C-w><Down>
noremap <C-k> <C-w><Up>
noremap <C-l> <C-w><Right>
noremap <C-h> <C-w><Left>

"window resizing shortcuts
noremap <A-l> <C-w>>
noremap <A-k> <C-w>+
noremap <A-j> <C-w>-
noremap <A-h> <C-w><
noremap <S-A-l> 10<C-w>>
noremap <S-A-k> 10<C-w>+
noremap <S-A-j> 10<C-w>-
noremap <S-A-h> 10<C-w><

"map the save command, since :w is annoying
map ZS :w<CR>

"shortcuts for editing/reloading vimrc
nmap <silent> <leader>ev :e ~/_vimrc <Bar> vsp ~/_gvimrc<CR>
nmap <silent> <leader>es :so ~/_vimrc <Bar> :so ~/_gvimrc<CR>

:cd ~

set autochdir

map <A-f> :NERDTreeToggle<CR>
imap <A-f> :NERDTreeToggle<CR>

