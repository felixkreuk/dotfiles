set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'gabrielelana/vim-markdown'
Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on
syntax enable
colorscheme molokai

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/bundle/felix-snippets"
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

set guifont=Monaco:h18
set background=dark
set laststatus=2
set number
set cursorline
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set showmatch           " highlight matching [{()}]
set wildmenu            " visual autocomplete for command menu
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
let mapleader = ","

" KEY MAPPIN
nmap <down> ddp " moving around lines
nmap <up> ddkP
nmap <C-k> ddkP
nmap <C-j> ddp
nmap <C-O> O<Esc> " inserting enter in normal mode
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>rr :source ~/.vimrc<cr>
nmap <leader>qq :q!<cr>
map <leader> <Plug>(easymotion-prefix)
map <c-[> :tabp<cr> 
map <c-]> :tabn<cr>
nmap <leader>vimrc :tabe ~/.vimrc<cr> " shortcut to opening the vimrc
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
