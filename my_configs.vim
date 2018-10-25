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
 Plug 'Shougo/neosnippet.vim'
 Plug 'Shougo/neosnippet-snippets'
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
" disable nvim trying to renber latex math
let g:tex_conceal = ''
" set default pdf viewer as skim
let g:vimtex_view_method = 'skim'
" --- VIMTEX ---

" --- NEO SNIPPET ---
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" --- NEO SNIPPET ---

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

" select monokai theme
colorscheme monokai

" set python for neovim
let g:python3_host_prog = '/Users/felixkreuk/anaconda3/bin/python'

