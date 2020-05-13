call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
call plug#end()

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/setting.vim

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vim-airline.vim
source $HOME/.config/nvim/nerd-commenter.vim
