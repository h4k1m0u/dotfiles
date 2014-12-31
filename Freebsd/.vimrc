" vim
syntax on
filetype indent on
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set number
let mapleader = ","
nnoremap <silent> <leader>w :w!<CR>
nnoremap ; :
nnoremap <leader>q <C-W>h
nnoremap <leader>r <C-W>l
nnoremap <leader>w <C-W>j
nnoremap <leader>e <C-W>k

" plugins
execute pathogen#infect()

" minibufexpl
nnoremap <silent> <leader>n :enew<CR>
nnoremap <silent> <leader>s :bp<CR>
nnoremap <silent> <leader>d :bn<CR>
nnoremap <silent> <leader>c :bd!<CR>

" nerdtree
let g:NERDTreeDirArrows=0
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>o :NERDTree %<CR>

" tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" ctrlp
nnoremap <silent> <leader>f :CtrlPCurWD<CR>

" ack
nnoremap <leader>a :Ack 

" save & run a python | C | nodejs script
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!gcc % -o %:r -Wall -lm && ./%:r<cr>
autocmd FileType javascript nnoremap <buffer> <F6> :w <Bar> :!node %<cr>
