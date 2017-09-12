execute pathogen#infect()
Helptags

" Misc
filetype plugin on
filetype indent on
syntax on
"colorscheme Base2Tone_EarthDark
colorscheme khaki


" Settings
set autoindent
set backupcopy=yes
set expandtab
set fillchars+=vert:\ 
set gfn=Monaco:h16:cANSI:qDRAFT
set guioptions=
set incsearch
set ignorecase smartcase
set number
set noruler
set scrolloff=4
set shiftround
set shiftwidth=2
set smarttab
set softtabstop=2
set tabstop=2
set title
set ttimeoutlen=50

" Lettings
let g:jsx_ext_required=0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 2

" Bindings
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-k> :wincmd k<CR>
map <silent> <C-l> :wincmd l<CR>
nmap \e :NERDTreeToggle<CR>
nmap \t :TagbarToggle<CR>
nmap \q :q<CR>
nmap \w :w<CR>
nmap \g :Gstatus<CR>
nmap \f :CtrlP<CR>
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

" Commandings
command! Econf sp ~/_vimrc
command! Esnips NERDTree ~/vimfiles/snippets
command! Esite NERDTree ~/Projects/IP-Website
command! So source %

autocmd VimEnter * Esite
