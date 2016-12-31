set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'bling/vim-airline'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'gabrielelana/vim-markdown'
Plugin 'godlygeek/tabular'
"Plugin 'vim-pandoc/vim-pandoc'
"Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mileszs/ack.vim'
"Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on
syntax enable
colorscheme Tomorrow-Night-Eighties

" ULTISNIPS
let g:UltiSnipsSnippetsDir="~/.vim/bundle/felix-snippets"
let g:UltiSnipsExpandTrigger="<S-a>"
let g:UltiSnipsJumpForwardTrigger="<C-k>"
let g:UltiSnipsJumpBackwardTrigger="<C-j>"
" YCM
let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-tab>', '<Up>']
let g:SuperTabDefaultCompletionType = '<tab>'

set guifont=Monaco:h18
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
let g:ycm_filetype_blacklist = {}   " clear ycm blacklist (needed to work with markdown)
let g:tex_flavor="latex"            " set all .tex files to be regonized at latex
let mapleader = ","

" KEY MAPPIN
nmap <down> ddp " moving around lines
nmap <up> ddkP
nmap <C-O> O<Esc> " inserting enter in normal mode
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>rr :source ~/.vimrc<cr>
nmap <leader>qq :q!<cr>
map <leader> <Plug>(easymotion-prefix)
nmap <leader>vimrc :tabe ~/.vimrc<cr> " shortcut to opening the vimrc
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" switch tabs
"nmap <c-'> :tabn<cr>
"nmap <c-\> :tabp<cr>
" scroll without moving cursor
nmap <c-j> <c-e>
nmap <c-k> <c-y>
