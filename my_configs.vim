 " Specify a directory for plugins
 " - For Neovim: ~/.local/share/nvim/plugged
 " - Avoid using standard Vim directory names like 'plugin'
 call plug#begin('~/.vim/plugged')
 if has('nvim')

" Auto-complete (deoplete)
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
 Plug 'davidhalter/jedi-vim'

 " File types
 Plug 'lervag/vimtex'

 " Visual interface
 Plug 'scrooloose/nerdcommenter'            " cc/cu add/remove comments
 Plug 'airblade/vim-gitgutter'              " adds marks for lines that differ from HEAD
 Plug 'nathanaelkane/vim-indent-guides'     " adds indentation guides
 Plug 'majutsushi/tagbar'                   " view classes/functions menu
 Plug 'bling/vim-airline'                   " cool airline
 Plug 'vim-airline/vim-airline-themes'

 Plug 'jiangmiao/auto-pairs'                " auto-closes opened pairs
 Plug 'mileszs/ack.vim'                     " search in project using :Ack
 Plug 'kshenoy/vim-signature'               " mark places in code (mx - mark x, `x jump to x)
 Plug 'vimwiki/vimwiki'                     " vim wiki plugin

 Plug 'chriskempson/base16-vim'             " colorscheme
 Plug 'joshdick/onedark.vim'                " colorscheme

 " Initialize plugin system
 call plug#end()

" set python provider
let g:python3_host_prog = "/usr/bin/python3"
let g:python_host_prog = "/usr/bin/python"

" -------------------------------------
" ------------- VIMTEX ----------------
" -------------------------------------

if has('unix')
    if has('mac')
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    else
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
    endif
elseif has('win32')

endif

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
let g:tex_conceal = ""

" Can hide specifc warning messages from the quickfix window
" Quickfix with Neovim is broken or something
" https://github.com/lervag/vimtex/issues/773
let g:vimtex_quickfix_latexlog = {
            \ 'default' : 1,
            \ 'fix_paths' : 0,
            \ 'general' : 1,
            \ 'references' : 1,
            \ 'overfull' : 1,
            \ 'underfull' : 1,
            \ 'font' : 1,
            \ 'packages' : {
            \   'default' : 1,
            \   'natbib' : 1,
            \   'biblatex' : 1,
            \   'babel' : 1,
            \   'hyperref' : 1,
            \   'scrreprt' : 1,
            \   'fixltx2e' : 1,
            \   'titlesec' : 1,
            \ },
            \}

" -------------------------------------
" ----------- NEOSNIPPET --------------
" -------------------------------------

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


" -------------------------------------
" ------------ SETTINGS ---------------
" -------------------------------------

" Gdiff open vertical by default
set diffopt+=vertical

" displaye line numbers
set number

" display cursorline
set cursorline
"
" select theme
"colorscheme monokai
"colorscheme dracula
"let g:onedark_termcolors=16
let g:onedark_terminal_italics=1
let base16colorspace=256
colorscheme onedark

" disable beeping by using visual bell
set visualbell

" show command line suggestions
set wildmenu

" show invisible chars
set list

" line breaks for wrap option
set showbreak=↪\
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set linebreak " set soft wrapping

" always show window status line
set laststatus=2

" air-line fonts for triangle shape
let g:airline_powerline_fonts=1

" air-line theme
let g:airline_theme='badwolf'

" -------------------------------------
" ------------ BINDINGS ---------------
" -------------------------------------

" display gitgutter
nmap <leader>gg :GitGutterToggle<cr>

" vimtex open table of contents
nmap <leader>toc :VimtexTocOpen<cr>

" fast quitting
nmap <leader>q :q<cr>

" open tagbar (classes and functions menu)
nmap <leader>tb :TagbarToggle<CR>

" toggle tab guide
nmap <leader>ig :IndentGuidesToggle<CR>

" <TAB>: completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" insert break point
nmap <leader>bp oimport ipdb; ipdb.set_trace()<esc>

" vimwiki default locations
let g:vimwiki_list = [{'path': '~/vimwiki/',
                       \ 'path_html': '~/vimwiki/html/',
                       \ 'template_path': '~/vimwiki/templates/',
                       \ 'template_default': 'def_template',
                       \ 'template_ext': '.html'}]

" vim-jedi
let g:jedi#goto_definitions_command = "<leader>gd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>gr"
