"execute pathogen#infect()
""""""""""""
"VUNDLE
""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-classpath'
Plugin 'Normangorman/slimux'

call vundle#end()
filetype plugin indent on

""""""""""""
"TEMPORARY BINDINGS
""""""""""""
nmap <F5> :!love .<CR><CR>

""""""""""""
"PLUGINS
""""""""""""
"NERDTree
nmap \e :NERDTreeToggle<CR>
"ULTISNIPS
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsEditSplit="vertical"
command! Snips UltiSnipsEdit

"Vim-Indent-Guides
nmap \i :IndentGuidesToggle<CR>
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=235
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=236
let g:indent_guides_guide_size = 1

"minibufexpl
nmap <C-n> :MBEbn<CR>
nmap <C-b> :MBEbp<CR>
nmap <C-x> :MBEbd<CR>
let g:miniBufExplStatusLineText="minibufexpl"

"slimux
nmap <C-t>t :SlimuxShellPrompt
vmap <C-t>s :SlimuxREPLSendSelection
vmap <C-t>l :SlimuxREPLSendLine
vmap <C-t>p :SlimuxREPLSendParagraph

"sexp
nmap <Space> ,
let g:sexp_mappings = {
    \ 'sexp_outer_list':                'af',
    \ 'sexp_inner_list':                'if',
    \ 'sexp_outer_top_list':            'aF',
    \ 'sexp_inner_top_list':            'iF',
    \ 'sexp_outer_string':              'as',
    \ 'sexp_inner_string':              'is',
    \ 'sexp_outer_element':             'ae',
    \ 'sexp_inner_element':             'ie',
    \ 'sexp_move_to_prev_bracket':      '(',
    \ 'sexp_move_to_next_bracket':      ')',
    \ 'sexp_move_to_prev_element_head': ',b',
    \ 'sexp_move_to_next_element_head': ',w',
    \ 'sexp_move_to_prev_element_tail': ',B',
    \ 'sexp_move_to_next_element_tail': ',W',
    \ 'sexp_move_to_prev_top_element':  ',[[',
    \ 'sexp_move_to_next_top_element':  ',]]',
    \ 'sexp_select_prev_element':       ',[e',
    \ 'sexp_select_next_element':       ',]e',
    \ 'sexp_indent':                    ',=',
    \ 'sexp_indent_top':                ',-',
    \ 'sexp_round_head_wrap_list':      ',lw',
    \ 'sexp_round_tail_wrap_list':      ',lW',
    \ 'sexp_square_head_wrap_list':     ',l[',
    \ 'sexp_square_tail_wrap_list':     ',l]',
    \ 'sexp_curly_head_wrap_list':      ',l{',
    \ 'sexp_curly_tail_wrap_list':      ',l}',
    \ 'sexp_round_head_wrap_element':   ',ew',
    \ 'sexp_round_tail_wrap_element':   ',eW',
    \ 'sexp_square_head_wrap_element':  ',e[',
    \ 'sexp_square_tail_wrap_element':  ',e]',
    \ 'sexp_curly_head_wrap_element':   ',e{',
    \ 'sexp_curly_tail_wrap_element':   ',e}',
    \ 'sexp_insert_at_list_head':       ',ih',
    \ 'sexp_insert_at_list_tail':       ',it',
    \ 'sexp_splice_list':               ',@',
    \ 'sexp_raise_list':                ',rl',
    \ 'sexp_raise_element':             ',re',
    \ 'sexp_swap_list_backward':        ',sl',
    \ 'sexp_swap_list_forward':         ',sL',
    \ 'sexp_swap_element_backward':     ',se',
    \ 'sexp_swap_element_forward':      ',sE',
    \ 'sexp_emit_head_element':         ',eh',
    \ 'sexp_emit_tail_element':         ',et',
    \ 'sexp_capture_prev_element':      ',ch',
    \ 'sexp_capture_next_element':      ',ct'
    \ }

""""""""""""
"MAPPINGS
""""""""""""
"easier keybinds for save and write
nmap \q :q<CR>
nmap \w :w<CR>

map <silent> <A-Up> :wincmd k<CR> 
map <silent> <A-Down> :wincmd w<CR>  
map <silent> <A-Left> :wincmd h<CR>  
map <silent> <A-Right> :wincmd l<CR>  

"It's clumsy to insert just a single character from normal mode, this is
"better
"map <Space> i_<Esc>r

""""""""""""
"COMMANDS
""""""""""""
"execute a program (assumes executable has same name as source file)
command! Exec !./%:r

"compile a C program
command! CC !cc -o %:r %
"compile and execute
command! CCE !cc -o %:r % && ./%:r

"compile a nim program
command! NimC !nim c %
"compile and execute
command! NimCE !nim c -r %

"edit .vimrc in a vertical split
command! Econf sp ~/.vimrc
"Swap panes
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

func! WordProcessorMode() 
    setlocal formatoptions=1 
    setlocal noexpandtab 
    setlocal spell spelllang=en_gb 
    set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
    set complete+=s
    set formatprg=par
    setlocal wrap 
    setlocal linebreak 
    nmap j gj
    nmap k gk
endfu 
com! WP call WordProcessorMode()

func! TabSize(n)
    let &l:tabstop=a:n
    let &l:shiftwidth=a:n
    let &l:softtabstop=a:n
endfu

""""""""""""
"FILETYPES
""""""""""""
syntax enable
au Filetype clojure :RainbowParenthesesToggle

"Syntax highlighting for markdown
autocmd BufNewFile,BufRead *.md set spell

"Shakespearean syntaxes
au BufRead,BufNewFile *.julius	set filetype=javascript
au BufNewFile,BufRead *.hamlet set filetype=html

let g:haddock_browser="/usr/share/applications/Chromium"
"C macro to add semicolons to ends of lines:
let @c = "A;<CR>"

"Nim plugin
fun! JumpToDef()
    if exists("*GotoDefinition_" . &filetype)
        call GotoDefinition_{&filetype}()
    else
        exe "norm! \<C-]>"
    endif
endf

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

""""""""""""
"COLOURS
""""""""""""
set t_Co=16
"don't show diving lines in split panes
set fillchars+=vert:\  
"Change code folding colours
highlight Folded ctermbg=black ctermfg=red

""""""""""""
"GENERAL
""""""""""""
set number
set ruler
set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab "always use spaces instead of tabs
set shiftround "round indent to nearest shiftwidth multiple
set incsearch "highlight search string as i'm typing it

set ttimeoutlen=50 "reduce pause when leaving insert mode
"Leave 4 lines visible when zt'ing
set scrolloff=4