" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
set rtp+=~/.dotfiles
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
 Plug 'deoplete-plugins/deoplete-jedi'
 Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
 let g:pymode_python = 'python3'
 let g:pymode_rope = 1
 let g:pymode_rope_completion = 0
 let g:pymode_rope_complete_on_dot = 0
 let g:pymode_lint_on_write = 0
 let g:pymode_breakpoint_cmd = 'import ipdb; ipdb.set_trace()'

 Plug 'tenfyzhong/CompleteParameter.vim'
 inoremap <silent><expr> ( complete_parameter#pre_complete("()")
 smap <c-w> <Plug>(complete_parameter#goto_next_parameter)
 imap <c-w> <Plug>(complete_parameter#goto_next_parameter)
 smap <c-q> <Plug>(complete_parameter#goto_previous_parameter)
 imap <c-q> <Plug>(complete_parameter#goto_previous_parameter)
 let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
 inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
 let g:complete_parameter_use_ultisnips_mapping = 1

 " dev
 Plug 'junegunn/vim-easy-align'
 Plug 'tpope/vim-fugitive'
 Plug 'junegunn/gv.vim'
 Plug 'heavenshell/vim-pydocstring'
  " install UltiSnips {{
   Plug 'SirVer/ultisnips'
   Plug 'honza/vim-snippets'

   " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
   let g:UltiSnipsExpandTrigger="<c-k>"
   let g:UltiSnipsJumpForwardTrigger="<c-k>"
   let g:UltiSnipsJumpBackwardTrigger="<c-j>"
   let g:UltiSnipsSnippetsDir=expand('~/.dotfiles/snips/')
   let g:UltiSnipsSnippetDirectories=['UltiSnips', 'snips']
   let g:UltiSnipsEditSplit="vertical"

   " this part allows to expand UltiSnips with enter <CR>
   "let g:ulti_expand_or_jump_res = 0 "default value, just set once
   "function! Ulti_ExpandOrJump_and_getRes()
      "call UltiSnips#ExpandSnippetOrJump()
      "return g:ulti_expand_or_jump_res
   "endfunction
   "inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>
 " }}

 " File types
 Plug 'lervag/vimtex'

 " Visual interface
 " NERDTree {{{
	Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	let g:WebDevIconsOS = 'Darwin'
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:DevIconsEnableFoldersOpenClose = 1
	let g:DevIconsEnableFolderExtensionPatternMatching = 1
	let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
	let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
	let NERDTreeNodeDelimiter = "\u263a" " smiley face

	augroup nerdtree
		autocmd!
		autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
		autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
	augroup END

	let NERDTreeShowHidden=1
	" let NERDTreeDirArrowExpandable = '▷'
	" let NERDTreeDirArrowCollapsible = '▼'
	let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }
" }}} 
 Plug 'scrooloose/nerdcommenter'            " cc/cu add/remove comments
 Plug 'kien/ctrlp.vim'
 Plug 'airblade/vim-gitgutter'              " adds marks for lines that differ from HEAD
 Plug 'nathanaelkane/vim-indent-guides'     " adds indentation guides
 Plug 'majutsushi/tagbar'                   " view classes/functions menu
 Plug 'bling/vim-airline'                   " cool airline
 Plug 'vim-airline/vim-airline-themes'
 Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
 Plug 'python/black'
 Plug 'jiangmiao/auto-pairs'                " auto-closes opened pairs
 Plug 'mileszs/ack.vim'                     " search in project using :Ack

 Plug 'chriskempson/base16-vim'             " colorscheme
 Plug 'joshdick/onedark.vim'                " colorscheme

" Initialize plugin system
call plug#end()

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
" ------------ SETTINGS ---------------
" ------------------------------------- 

let mapleader=','

" Gdiff open vertical by default
set diffopt+=vertical 

" displaye line numbers
set number

" display cursorline
set cursorline
"

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

" turn on git-gutter by default
let g:gitgutter_enabled = 1

" reduce gitgutter update time
set updatetime=100

" jedi-vim completion hangs uppon dot completion
" so i disabled it because deoplete-jedi already
" does this async
let g:jedi#completions_enabled = 0
" ignore suggestions from current buffer
"call deoplete#custom#option('ignore_sources', {'_': ['around', 'buffer']})

" makes deoplete-jedi show docstring when writing
let g:deoplete#sources#jedi#show_docstring = 1

" set path to ack
let g:ackprg = "~/installations/ack -s -H --nogroup --column"

let g:python3_host_prog  = '/usr/bin/python3'

" -------------------------------------
" -------------- THEME ----------------
" ------------------------------------- 

let base16colorspace=256
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
" switch cursor to line when in insert mode, and block when not
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
\,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
\,sm:block-blinkwait175-blinkoff150-blinkon175

if &term =~ '256color'
    " disable background color erase
    set t_ut=
endif

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" had an issue with tmux changing the colors inside vim
if exists('$TMUX')
    " Colors in tmux
    let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
set background=dark
colorscheme onedark

" -------------------------------------
" ------------ BINDINGS ---------------
" ------------------------------------- 

" display gitgutter
nmap <leader>gg :GitGutterToggle<cr>

" vimtex open table of contents
nmap <leader>toc :VimtexTocOpen<cr>

" fast quitting & saving
nmap <leader>q :q<cr>
nmap <leader>w :w<cr>

" open tagbar (classes and functions menu)
nmap <leader>tb :TagbarToggle<CR>

" toggle tab guide
nmap <leader>ig :IndentGuidesToggle<CR>

" <TAB>: completion for deoplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" insert break point
nmap <leader>bp oimport ipdb; ipdb.set_trace()<esc>

" search all break points
nmap <leader>bb :Ack pdb<cr>

" fugitive
nmap <silent> <leader>gs :Gstatus<cr>
nmap <leader>ge :Gedit<cr>
nmap <silent><leader>gr :Gread<cr>
nmap <silent><leader>gb :Gblame<cr>

" go to end of line in insert mode
inoremap <C-e> <C-o>$

" pydocstring
nmap <silent><leader>py <Plug>(pydocstring)

" NERDTree
nmap <leader>nn :NERDTreeToggle<cr>

" Pane moving
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>

" Search using space
nmap <space> /

" call CtrlP fuzzy file search
nmap <c-f> :CtrlP<cr>

" turn off search highlighting
nmap <leader><cr> :noh<CR>

" Black formatting
nmap <leader>bl :Black<CR>
" autocmd BufWritePre *.py execute ':Black'

" move according to actual wrapped lines not file lines
:noremap <Up> gk
:noremap! <Up> <C-O>gk
:noremap <Down> gj
:noremap! <Down> <C-O>gj
:nmap <End> g$
:nmap <Home> g0

" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
