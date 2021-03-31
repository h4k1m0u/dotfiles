" plugins
execute pathogen#infect()

" vim
syntax on
filetype plugin indent on
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
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
set showcmd

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
noremap <leader>f <C-d>
noremap <leader>b <C-u>

" visual line & block selection
nnoremap vvl <S-v>
nnoremap vvb <c-v>

" traverse block by block 
noremap tj }
noremap tk {

" paste from system clipboard: apt install vim-gtk
nnoremap <leader>p "+p
xnoremap <leader>p "+p
nnoremap <leader>v "*p
xnoremap <leader>v "*p

" use 0" register in visual mode instead of defaul one
" https://stackoverflow.com/a/1504373/2228912
xnoremap d "0d
xnoremap p "0p

" status bar
set laststatus=2
set statusline+=%F

" nerdtree
let g:NERDTreeDirArrows=0
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader>o :NERDTree %<CR>

" tagbar
nnoremap <silent> <F4> :TagbarToggle<CR>

" ack: search word in search register or under cursor
" nnoremap <leader>a :Ack <C-r>/<CR>
let g:searched_word = expand("<cword>")
nnoremap <leader>a :execute ":Ack" . g:searched_word<CR>

" ctrlp
nnoremap <silent> <leader>s :CtrlPRoot<CR>
let g:ctrlp_custom_ignore = 'node_modules\|git\|build\|bin\|CMakeFiles\|.clangd\|docs\|resources\|pointclouds'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ale linter: disable for cpp
" let g:ale_linters = {'cpp': [], 'python': []}
" let g:ale_linters = {'cpp': [], 'c': []}

" youautocompleteme:
" disable linter & change shortcuts
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']
let g:ycm_clangd_args=['--header-insertion=never']

" don't show upper window & trigger suggestions automatically
set completeopt-=preview
let g:ycm_semantic_triggers = {
      \ 'c': ['re!\w{2}']
      \ }

" ale: set path for clang linter to parse compile_commands.json (comes with ycm)
let g:ale_c_cc_executable = '/home/hakim/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/clangd/output/bin/clangd'
let g:ale_cpp_cc_executable = '/home/hakim/.vim/bundle/YouCompleteMe/third_party/ycmd/third_party/clangd/output/bin/clangd'

" ultisnips with honza/vim-snippets: set shortcuts
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" debugging with <F5>
" tnoremap <Esc> <C-\><C-n>
" autocmd FileType cpp nnoremap <buffer> <F5> :w <Bar> :packadd termdebug <Bar> Termdebug ./%:r<cr>
" let g:termdebug_wide=1

" run scripts with <F6>
autocmd FileType python nnoremap <buffer> <F6> :w <Bar> :!python3 %<cr>
autocmd FileType c nnoremap <buffer> <F6> :w <Bar> :!cc % -o %:r -Wall && ./%:r<cr>

" build cpp project with make
execute "autocmd FileType cpp nnoremap <buffer> <F6> :w <Bar> :!cd .. && make && echo && ./bin/%:r<cr>"

" change filetype for syntax highlighting
autocmd BufNewFile,BufRead *.html set filetype=javascript
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.axaml set filetype=xml

" add license automatically to new cpp or py files
autocmd BufNewFile *.cpp :0r ~/.vim/license-cpp.txt
autocmd BufNewFile *.py :0r ~/.vim/license-py.txt

" Load custom snippets
autocmd FileType javascript,javascriptreact,html UltiSnipsAddFiletypes javascript-custom
autocmd FileType cpp UltiSnipsAddFiletypes cpp-custom

" use correct colorscheme in tmux
set background=dark
set t_Co=256

" check also subfolders for ctags
set tags=tags;/
