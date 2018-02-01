""""""""""""
" Plugins
""""""""""""
set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'flazz/vim-colorschemes'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()
filetype plugin indent on

""""""""""""""
" Temporary
""""""""""""""
command! Eproject NERDTree ~/Projects
command! Emod NERDTree "C:\Program Files (x86)\Steam\steamapps\common\King Arthur's Gold\Mods\KAG-1v1-ladder-dev"
au BufEnter *.as set filetype=angelscript syntax=cpp
command! Kagdocs sp C:\Program Files (x86)\Steam\steamapps\common\King Arthur's Gold\Manual\interface
nmap <F2> :Kagdocs<CR>
filetype on
syntax on

""""""""""""""
" Settings
""""""""""""""
colorscheme ashen
set noswapfile
set autoindent
set backupcopy=yes
set expandtab
set fillchars+=vert:\ 
set incsearch
set ignorecase smartcase
set number
set noruler
set scrolloff=4
set shiftround
set shiftwidth=4
set smarttab
set softtabstop=4
set tabstop=4
set title
set ttimeoutlen=50

""""""""""""""
" Lettings
""""""""""""""
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 2

""""""""""""""
" Bindings
""""""""""""""
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-l> :wincmd l<CR>
nmap <Insert> "+p
nmap \e :NERDTreeToggle<CR>
nmap \q :q<CR>
nmap \w :w<CR>
nmap \i :IndentGuidesToggle<CR>
" select last paste in visual mode
nnoremap <expr> gb '`[' . strpart(getregtype(), 0, 1) . '`]'
imap <C-h> <Left><C-o>x
imap <C-l> <C-o>x
imap <C-w> <C-o>dw
imap <C-k> <C-o>d$
imap <C-b> <C-o>db
nmap < <<
nmap > >>
nmap < <<
nmap > >>
vmap < <<
vmap > >>
vmap < <<
vmap > >>

""""""""""""""
" Commandings
""""""""""""""
command! Econf sp ~/.vimrc
command! Esnips NERDTree ~/vimfiles/snippets
command! So source %
