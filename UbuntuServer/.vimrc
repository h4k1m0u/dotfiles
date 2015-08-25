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
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k

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

" save & run shell, python, C, nodejs scripts
autocmd FileType sh nnoremap <buffer> <F6> :w <Bar> :!bash %<cr>
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!cc % -o %:r.o -Wall -lm && ./%:r.o<cr>
autocmd FileType javascript nnoremap <buffer> <F6> :w <Bar> :!node %<cr>

" xml beautify
command Xmlbeautify :%s/></>\r</g <Bar> :norm gg=G
