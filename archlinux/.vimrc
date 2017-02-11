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

" ctrlp
nnoremap <silent> <leader>f :CtrlPCurWD<CR>

" run scripts
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!cc % -o %:r.o -Wall -lm && ./%:r.o<cr>
autocmd FileType cpp nnoremap <buffer> <F6> :w <Bar> :!g++ % -o %:r.o && ./%:r.o<cr>

