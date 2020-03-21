" plugins
execute pathogen#infect()
let g:syntastic_python_checkers=['flake8']

" vim
syntax on
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set number
let mapleader = ","
nnoremap <silent> <leader>w :w!<CR>
nnoremap ; :
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>q :bd<CR>
set autochdir

" change font & color scheme
colorscheme monokai

" nerdtree
let g:NERDTreeDirArrows=0
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>o :NERDTree %<CR>

" tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" ctrlp
nnoremap <silent> <leader>f :CtrlPCurWD<CR>

" ack
nnoremap <leader>a :Ack<space>

" run scripts
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!cc % -o %:r -Wall && ./%:r<cr>

" build cpp project with make
execute "autocmd FileType cpp nnoremap <buffer> <F6> :w <Bar> :!cd .. && make && echo && ./bin/%:r<cr>"
