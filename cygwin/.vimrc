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
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
autocmd FileType cpp nnoremap <buffer> <F6> :w <Bar> :!build-solution && bin/Release/%:r.exe<cr>
set shellcmdflag=-ic
