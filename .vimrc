execute pathogen#infect()
filetype plugin indent on
filetype plugin on
syntax enable
colorscheme molokai

set background=dark
set laststatus=2
set number

let mapleader = ","

" KEY MAPPIN
nmap <down> ddp " moving around lines
nmap <up> ddkP
nmap <C-k> ddkP
nmap <C-j> ddp
nmap <C-O> O<Esc> " inserting enter in normal mode
nmap <C-q> :q<cr>
nmap <leader>nt :NERDTreeToggle<cr>
