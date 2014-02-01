" author h4k1m0u

" Add pathogen to vim
execute pathogen#infect()

" Enable syntax highlighting
syntax on

" Enable file type specific plugins
filetype plugin on

" Set color scheme
set t_Co=256
colorscheme molokai

" Map leader key to comma
let mapleader = ","

" Some editor constants
set number
set cursorline
set hlsearch

" Indentation, tab width & expand tab to space
set autoindent
set tabstop=4 " for <TAB>
set shiftwidth=4 " for >>
set expandtab

" Set folding on indentation
set foldmethod=indent

" Hide modified buffers even without saving
set hidden

" Html tags
set matchpairs+=<:>

" Time-saving hotkeys instead of :Ex
nnoremap <silent> <leader><leader> :nohls<cr>
nnoremap ; :
vnoremap ; :
 
" Simplify Split & Buffers switching
nnoremap <silent> + :vnew<CR>
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-W> <C-W>c

nnoremap <silent> bn :enew<CR>
nnoremap <silent> bj :bp<CR>
nnoremap <silent> bk :bn<CR>
nnoremap <silent> bq :bd!<CR>

" Save a readonly file
cmap w!! w !sudo tee > /dev/null %<CR>
"------------------------------------------------------------- Plugins

" NERDTree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <C-O> :NERDTree %<CR>

" Session
nnoremap <silent> <F7> :SaveSession<CR>
nnoremap <silent> <F8> :OpenSession<CR>

" Project
nmap <silent> <F3> <Plug>ToggleProject

" Tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" CtrlP
nnoremap <silent> <leader>f :CtrlPCurWD<CR>
nnoremap <silent> <leader>F :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" Autoclose
let g:autoclose_vim_commentmode = 1

" Ack
nnoremap <leader>a :Ack 

" Gist
nnoremap <silent> <leader>g :Gist<CR>

" Eclim
inoremap <C-space> <C-x><C-u>

" Plugins needing python
" Conque
nnoremap <silent> <leader>c :ConqueTermVSplit phpsh<CR>

" Gundo
nnoremap <silent> <F5> :GundoToggle<CR>

"------------------------------------------------------------- Language
"specific

" Syntactic
let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_python_checkers=['python', 'pyflakes']

" save & run a python or a C script
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!gcc % -o %:r -Wall -lm && ./%:r<cr>
