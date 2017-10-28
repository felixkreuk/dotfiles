set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.local/share/nvim/plugged/')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-jedi'
Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'python-mode/python-mode', {'branch': 'develop'}
Plug 'nvie/vim-flake8'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
call plug#end()

let python_highlight_all=1
let mapleader = ","
syntax on
colorscheme Tomorrow-Night-Eighties
let g:deoplete#enable_at_startup = 1 " start deoplete settings
let g:deoplete#enable_ignore_case = 1
set completeopt+=noinsert " select first items in list
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
autocmd CompleteDone * silent! pclose! " close doc preview ,end deoplete settings
let g:python_host_prog = '/Users/felix/Applications/Anaconda/anaconda/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
set laststatus=2
set number
set cursorline
set incsearch                       " search as characters are entered
set hlsearch                        " highlight matches
set showmatch                       " highlight matching [{()}]
set wildmenu                        " visual autocomplete for command menu
set expandtab                       " tabs are spaces
set tabstop=4                       " number of visual spaces per TAB
set softtabstop=4                   " number of spaces in tab when editing
set lazyredraw
set backspace=indent,eol,start

" Enable folding
set foldmethod=indent
set foldlevel=99
set encoding=utf-8

" KEY MAPPIN
nmap <down> ddp " moving around lines
nmap <up> ddkP
nmap <C-O> O<Esc> " inserting enter in normal mode
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>tt :NERDTreeFind<CR>
nmap <leader>rr :source ~/.vimrc<cr>
nmap <leader>qq :q!<cr>
nmap <leader>wq :wq<cr>
map <leader> <Plug>(easymotion-prefix) " ctrl-w
nmap <leader>vimrc :tabe ~/.config/nvim/init.vim<cr> " shortcut to opening the vimrc
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding with the spacebar
nnoremap <space> za

" insert break points in python files
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" lint
noremap <F1> :PymodeLintAuto<CR>
