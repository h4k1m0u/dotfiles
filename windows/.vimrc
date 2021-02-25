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
nnoremap <leader>q :bd<CR>
set autochdir

" use 0" register in visual mode instead of defaul one
" https://stackoverflow.com/a/1504373/2228912
xnoremap d "0d
xnoremap p "0p

" change font & color scheme
set guifont=Consolas:h11:cANSI
colorscheme monokai

" UTF-8 encoding for decoding & output
set encoding=utf-8
set fileencoding=utf-8

" navigation & line break
nnoremap <leader>f <C-d>
nnoremap <leader>b <C-u>
xnoremap <leader>f <C-d>
xnoremap <leader>b <C-u>

" traverse block by block 
noremap tj }
noremap tk {

" visual line & block selection
nnoremap vvl <S-v>
nnoremap vvb <c-v>

" plugins
" pathogen
execute pathogen#infect()

" nerdtree
let g:NERDTreeDirArrows=0
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>o :NERDTree %<CR>

" ctrlp
nnoremap <silent> <leader>s :CtrlPRoot<CR>
let g:ctrlp_custom_ignore = 'node_modules\|git\|build\|bin\|CMakeFiles\|.clangd\|docs\|resources\|pointclouds'
