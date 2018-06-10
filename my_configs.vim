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
 Plug 'jiangmiao/auto-pairs'
 " Initialize plugin system
 call plug#end()

" --- VIMTEX ---
" vimtex instructed to add this
let g:vimtex_compiler_progname = 'nvr'
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.tex = g:vimtex#re#deoplete
" without this line .tex files that were included were recognized as 'plaintex'
" see here: https://github.com/lervag/vimtex/issues/438
let g:tex_flavor = 'latex'
let g:vimtex_complete_close_braces = 1

" fast quitting
nmap <leader>q :q<cr>

" <TAB>: completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Gdiff open vertical by default
set diffopt+=vertical 

" displaye line numbers
set number

" display cursorline
set cursorline

" insert break point
nmap <leader>bp oimport ipdb; ipdb.set_trace()<esc>
