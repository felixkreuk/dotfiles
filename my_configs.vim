 " Specify a directory for plugins
 " - For Neovim: ~/.local/share/nvim/plugged
 " - Avoid using standard Vim directory names like 'plugin'
 call plug#begin('~/.vim/plugged')

 if has('nvim')
   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 else
   Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
 endif
 let g:deoplete#enable_at_startup = 1
 Plug 'zchee/deoplete-jedi'
 Plug 'lervag/vimtex'
 " Initialize plugin system
 call plug#end()

" <TAB>: completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" vimtex instructed to add this
let g:vimtex_compiler_progname = 'nvr'
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
