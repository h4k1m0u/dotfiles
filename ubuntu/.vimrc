" plugins
execute pathogen#infect()

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

" toggle split screen vertically between buffers
let g:is_vsplit_close = 1
nnoremap <F3> :call SplitScreenToggle()<CR>

function! SplitScreenToggle()
    if g:is_vsplit_close
        execute "vertical belowright sbnext 1"
        let g:is_vsplit_close = 0
    else
        execute "normal! \<C-w>c"
        let g:is_vsplit_close = 1
    endif
endfunction

" comments
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" navigation & line break
nnoremap <leader>f <C-d>
nnoremap <leader>b <C-u>
xnoremap <leader>f <C-d>
xnoremap <leader>b <C-u>
nnoremap <leader>e i<CR><Esc>
nnoremap <leader>r J

" paste from system clipboard: apt install vim-gtk
nnoremap <leader>v "+p
xnoremap <leader>v "+p

" use 0" register in visual mode instead of defaul one
" https://stackoverflow.com/a/1504373/2228912
xnoremap d "0d
xnoremap p "0p

" status bar
set laststatus=2
set statusline+=%F

" change font & color scheme
colorscheme monokai

" nerdtree
let g:NERDTreeDirArrows=0
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>o :NERDTree %<CR>

" tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" ack
nnoremap <leader>a :Ack<space>

" ctrlp
nnoremap <silent> <leader>s :CtrlPCurWD<CR>

" ale linter: disable for cpp
let g:ale_linters = {'cpp': []}

" debugging with <F5>
tnoremap <Esc> <C-\><C-n>
autocmd FileType cpp nnoremap <buffer> <F5> :w <Bar> :packadd termdebug <Bar> Termdebug ./%:r<cr>
let g:termdebug_wide=1

" run scripts with <F6>
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!cc % -o %:r -Wall && ./%:r<cr>

" build cpp project with make
execute "autocmd FileType cpp nnoremap <buffer> <F6> :w <Bar> :!cd .. && make && echo && ./bin/%:r<cr>"
