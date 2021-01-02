" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

call plug#end()

" show line numbers
set number
highlight LineNr ctermfg=darkgrey

set encoding=UTF-8
set guifont=Hack\ Nerd\ Font:h12

let mapleader = " "

""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""
" replace tabs with spaces
set expandtab
" 1 tab = 2 spaces
set tabstop=2 shiftwidth=2
" delete ws at start of line deletes 2 tabs
" set smarttab
" creating a new line => copy prev indentation
set autoindent
set scrolloff=20

""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""
" Ignore case
set ignorecase
set smartcase

" highligh results
set hlsearch
set incsearch

""""""""""""""""""""""""""
" Mix
""""""""""""""""""""""""""
" show matching brackets
set showmatch

""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""
" auto-open on open of directlry
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close if only tree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open automatically if no file / dir specified
autocmd StdinReadPre * let s:std_in=1
autocmd BufWinEnter * NERDTreeMirror
" make clickable!
set mouse=a
let g:NERDTreeMouseMode=3
" double click to open in new tab
autocmd VimEnter * call NERDTreeAddKeyMap({ 'key': '<2-LeftMouse>', 'scope': "FileNode", 'callback': "OpenInTab", 'override':1 })
function! OpenInTab(node)
  call a:node.activate({'reuse': 'all', 'where': 't'})
endfunction

" Easily move lines up/down (Opt + dir)
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Navigation (Control + dir)
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark 
map <leader>nf :NERDTreeFind<cr>

" Tab for COC autocomplete
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
inoremap <expr> <CR> pumvisible() ? coc#_select_confirm() : "<CR>"
