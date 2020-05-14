let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" insert break point
nmap <leader>bp oimport ipdb; ipdb.set_trace()<esc>

" Pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" turn off search highlighting
nmap <leader><cr> :noh<CR>

:nmap <End> g$
:nmap <Home> g0
