call plug#begin('~/.vim/plugged')

" Plug 'benmills/vimux'
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neosnippet.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/mru.vim'
Plug 'Yggdroot/indentLine'
Plug 'zchee/deoplete-go', { 'do': 'make'}
"Plug 'google/vim-jsonnet'
Plug 'zchee/deoplete-jedi'

call plug#end()
call deoplete#enable()

let mapleader="`"
let g:deoplete#sources#jedi#python_path = "/usr/local/bin/python3"
autocmd CompleteDone * silent! pclose! " close deoplete preview

nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>f :MRU<CR>
nmap <leader>o :Econf<CR>
nmap <leader>p :PlugInstall<CR>
nmap <leader>t :TagbarToggle<CR>
nmap <F5> :GoTest<CR>
vmap <leader>c "*y
nmap <leader>v "*p
map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>
map <silent> <leader>l :wincmd l<CR>
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-l> :wincmd l<CR>
nmap <space> /
nmap <C-space> ?

""" PLUGINS
" NERDTree
let NERDTreeShowHidden=1

" Goyo
let g:goyo_width = 100

" lightline
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ }

" gruvbox
let g:gruvbox_vert_split="bg1"

" Pymode
let g:pymode_options = 0
let g:pymode_rope = 0
let g:pymode_python='python3'
let g:pymode_lint_checkers=['pylint', 'pycodestyle']
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 1
let g:pymode_folding=0
let g:pymode_options_max_line_length = 99
let g:pymode_lint_ignore = ""
let g:pymode_rope_completion = 0

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/plugged/vim-snippets/snippets'
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)
xmap <C-o>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

""" COMMANDS
command! Econf sp ~/.config/nvim/init.vim
command! Ebash sp ~/.bash_profile
command! Etmux sp ~/.tmux.conf
command! So source %
command! Snips NeoSnippetEdit

""" SETTINGS
set t_Co=256
set background=dark
colorscheme gruvbox
filetype plugin on
filetype indent on
set encoding=utf8
set fillchars=vert:\ 
set autoindent
set expandtab
set ignorecase smartcase
set incsearch
set noswapfile
set nonumber
setl nonumber
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
set so=5 " causes the cursor to stay at least N lines above the bottom when scrolling
"set fillchars=vert:\ 
set nohlsearch
set conceallevel=0 " disable json quote hiding in json-vim

" NOTES
" z., zz, zt, zb allow you to jump the cursor around
