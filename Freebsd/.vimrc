" vim
syntax on
set tabstop=4
set shiftwidth=4
set hlsearch
set number
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
