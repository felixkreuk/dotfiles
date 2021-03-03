call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fuzzy search
Plug 'junegunn/fzf.vim'                                 " fuzzy search
Plug 'airblade/vim-gitgutter'                           " mark lines that changed from list commit
Plug 'tpope/vim-fugitive'                               " vim git integration
Plug 'liuchengxu/vim-which-key'                         " define and show vim key-bindings
Plug 'joshdick/onedark.vim'                             " colorscheme
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlighting
Plug 'christoomey/vim-tmux-navigator'                   " navigate tmux and vim with ctrl+hjkl
Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
Plug 'ryanoasis/vim-devicons'
Plug 'vimpostor/vim-tpipeline'
Plug 'voldikss/vim-floaterm'
call plug#end()

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/setting.vim

source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/vim-airline.vim
source $HOME/.config/nvim/nerd-commenter.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/which-key.vim
source $HOME/.config/nvim/one-dark.vim
source $HOME/.config/nvim/tpipeline.vim
source $HOME/.config/nvim/floaterm.vim
