""" Dependencies: curl, git
""" SETUP
" Install the plugin manager vim-plug if it doesn't already exist
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" change the <leader> key to `. This is nice on Macs.
" <leader> is a prefix for many keybindings.
let mapleader="`"


""" PLUGINS
call plug#begin('~/.vim/plugged')

" a convenient file browser
Plug 'scrooloose/nerdtree'

" better window/split navigation when using tmux too
Plug 'christoomey/vim-tmux-navigator'

" the plugin manager itself. this way we get docs for it
Plug 'junegunn/vim-plug'

call plug#end()


""" PLUGIN CONFIG
" always show hidden files with NERDTree
let NERDTreeShowHidden=1

" use <leader>e to open NERDTree
nmap <leader>e :NERDTreeToggle<CR>


""" KEY BINDINGS
" use <leader>q to quit
nmap <leader>q :q<CR> 

" use <leader>w to save
nmap <leader>w :w<CR>

" use <leader>c to copy to system clipboard
vmap <leader>c "*y

" use <leader>v to paste from system clipboard
nmap <leader>v "*p

" use Ctrl-{h,j,k,l} to navigate windows rather than Ctrl-W then {h,j,k,l}
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-l> :wincmd l<CR>


""" COMMANDS
command! EditConfig sp ~/.vimrc


""" SETTINGS
" keep the same indentation level when starting a new line
set autoindent 

" use utf-8 encoding for files by default
set encoding=utf8 

" convert tabs to repeated spaces
set expandtab
set tabstop=4
set shiftwidth=4

" better search behaviour: ignore case unless there are capital letters in search query
set ignorecase smartcase

" highlight search results as you type
set incsearch

" don't highlight all of the matches after searching for something
set nohlsearch

" don't use line numbers
set nonumber

" don't create temporary backup/swap files
set noswapfile

" prefer to open split panes to the right/below of what's already open
set splitbelow
set splitright

" keep the cursor at least 5 lines from edge while scrolling
set scrolloff=5  
