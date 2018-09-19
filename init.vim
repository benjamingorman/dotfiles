call plug#begin('~/.vim/plugged')

Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'fatih/vim-go'
Plug 'justinmk/vim-sneak'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'
Plug 'vim-scripts/mru.vim'

call plug#end()
call deoplete#enable()

let mapleader="`"
let g:deoplete#sources#jedi#python_path = "/usr/local/bin/python3"
"autocmd CompleteDone * silent! pclose! " close deoplete preview

" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <LocalLeader>vs "vy :call VimuxSlime()<CR>

nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>q :q<CR>
nmap <leader>w :w<CR>
nmap <leader>t :terminal<CR>
nmap <leader>g :Goyo<CR>
nmap <leader>f :MRU<CR>
nmap <F5> :GoTest<CR>
" exit terminal by pressing Esc 
map <Leader>vp :VimuxPromptCommand<CR>
map <silent> <leader>h :wincmd h<CR>
map <silent> <leader>j :wincmd j<CR>
map <silent> <leader>k :wincmd k<CR>
map <silent> <leader>l :wincmd l<CR>
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-l> :wincmd l<CR>


""" PLUGINS
" NERDTree
let NERDTreeShowHidden=1


" Goyo
let g:goyo_width = 100

" Vimux
function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

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

command! Econf sp ~/.config/nvim/init.vim
command! Ebash sp ~/.bash_profile
command! Etmux sp ~/.tmux.conf
command! So source %

set background=dark
colorscheme gruvbox
filetype plugin on
filetype indent on
set t_Co=256
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

" NOTES
" z., zz, zt, zb allow you to jump the cursor around
