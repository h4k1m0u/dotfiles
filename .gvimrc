" Set font for GVim 
set guifont=InconsolataPlus0\ Bold\ 11

"------------------------------------------------------------- Plugins

" MiniBufExplorer [for GVim C-Tab]
let g:miniBufExplMapCTabSwitchBufs = 1

" Conque (for GVim ie: needs python support)
nnoremap <silent> <leader>c :ConqueTermVSplit phpsh<CR>

" Gundo (for GVim ie: needs python support)
nnoremap <silent> <F5> :GundoToggle<CR>

