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
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" plugins
execute pathogen#infect()

" minibufexpl
nnoremap <silent> <C-n> :enew<CR>
nnoremap <silent> <C-j> :bp<CR>
nnoremap <silent> <C-k> :bn<CR>
nnoremap <silent> <C-c> :bd!<CR>

" nerdtree
let g:NERDTreeDirArrows=0
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <C-O> :NERDTree %<CR>

" tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" ctrlp
nnoremap <silent> <leader>f :CtrlPCurWD<CR>

" save & run a python | C | nodejs script
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!gcc % -o %:r -Wall -lm && ./%:r<cr>
autocmd FileType javascript nnoremap <buffer> <F6> :w <Bar> :!node %<cr>
