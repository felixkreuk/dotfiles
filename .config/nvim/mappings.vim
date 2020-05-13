let mapleader=","

" fast quitting & saving
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>

" insert break point
nmap <leader>bp oimport ipdb; ipdb.set_trace()<esc>

" search all break points
nmap <leader>bb :Ack pdb<cr>

" go to end of line in insert mode
inoremap <C-e> <C-o>$

" Pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Search using space
" nmap <space> /

" turn off search highlighting
nmap <leader><cr> :noh<CR>

:nmap <End> g$
:nmap <Home> g0
