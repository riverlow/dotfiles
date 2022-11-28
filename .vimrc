" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
if has('nvim')
call plug#begin(stdpath('data') . '/plugged')
else
call plug#begin('~/.vim/plugged')
endif
"
" ========================== nvim-treesitter ============================
if has('nvim')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
endif


"
" ============================== vim-go ==============================
" Plug 'fatih/vim-go', {  'do': ':GoUpdateBinaries' }
" Plug 'fatih/vim-go'

" ============================== ultisnips ==============================
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'
"
" ============================== fzf ==============================
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"
" ============================== ale ==============================
" Plug 'dense-analysis/ale'
"
"

" ============================== coc.nvim ==============================
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ============================== deoplete ==============================
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
"
" ============================== tagbar ==============================
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
"
" ============================== for convenient ==============================
" key: gS, gJ
Plug 'AndrewRadev/splitjoin.vim'
" vim-bracketed-paste enables transparent pasting into vim. (i.e. no more :set paste!)
Plug 'ConradIrwin/vim-bracketed-paste'
" This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.,
Plug 'Raimondi/delimitMate'
" https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'
" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. 
" cs"', cst"(total), ds"(delete), etc.
Plug 'tpope/vim-surround'
" gc, gc<motion>, gcap
Plug 'tpope/vim-commentary'
" Vim sugar for the UNIX shell commands that need it the most.
Plug 'tpope/vim-eunuch'
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
Plug 't9md/vim-choosewin'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'tpope/vim-repeat'
"
" ============================== specific ==============================
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'corylanou/vim-present', {'for' : 'present'}
Plug 'plasticboy/vim-markdown'
Plug 'roxma/vim-tmux-clipboard'
"Plug 'tmux-plugins/vim-tmux', {'for': 'tmux'}
"Plug 'tmux-plugins/vim-tmux-focus-events'
" I'm not going to lie to you; fugitive.vim may very well be the best Git wrapper of all time. 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
"Plug 'ervandew/supertab'
Plug 'lyokha/vim-xkbswitch'
Plug 'andrewstuart/vim-kubernetes'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-haml'
"
" ============================== color and theme ==============================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'joshdick/onedark.vim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'cocopon/iceberg.vim',
" Plug 'gkeep/iceberg-dark'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'bluz71/vim-moonfly-colors'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'joshdick/onedark.vim'
" Plug 'connorholyday/vim-snazzy' 			" not clear
" Plug 'sonph/onehalf' 						" buggy
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'endel/vim-github-colorscheme'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'bling/vim-bufferline'
call plug#end()
"
" ============================== setttings ==============================
" ~/.viminfo needs to be writable and readable. Set oldfiles to 1000 last
" recently opened files, :FzfHistory uses it
set viminfo='1000
if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

if exists('&breakindent')
	set breakindent
endif
set tw=0 " If it is zero then 79 is used :verbose setlocal formatoptions?

" r       Automatically insert the current comment leader after hitting <Enter> in Insert mode.  
" o       Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
" tcroqwan2vblmMB1j
set formatoptions+=cqnmMB1j
set formatoptions-=trowa2vbl


set nocompatible
set nobackup                 " Don't create annoying backup files
set nowritebackup
set noswapfile               " Don't use swapfile
set mouse=a                  " Enable mouse mode


" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

" Suggestion: By default, govim populates the quickfix window with diagnostics
" reported by gopls after a period of inactivity, the time period being
" defined by updatetime (help updatetime). Here we suggest a short updatetime
" time in order that govim/Vim are more responsive/IDE-like
set updatetime=500

" Suggestion: To make govim/Vim more responsive/IDE-like, we suggest a short
" balloondelay
set balloondelay=250

" Suggestion: Turn on the sign column so you can see error marks on lines
" where there are quickfix errors. Some users who already show line number
" might prefer to instead have the signs shown in the number column; in which
" case set signcolumn=number
set signcolumn=number

syntax on
filetype plugin on

" Suggestion: turn on auto-indenting. If you want closing parentheses, braces
" etc to be added, https://github.com/jiangmiao/auto-pairs. In future we might
" include this by default in govim.
set autoindent
set smartindent
filetype indent on

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
set backspace=2

" Suggestion: show info for completion candidates in a popup menu
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif



scriptencoding utf-8
set encoding=utf-8
set number                   " Show line numbers
" set numberwidth=5
set noexpandtab
set shiftwidth=4
set tabstop=4

set autowrite                " Automatically save before :next, :make etc.
set belloff+=ctrlg           " If Vim beeps during completion
set cmdheight=2
set completeopt=menu,menuone,noinsert
set completeopt-=preview,noselect
set conceallevel=2           " Concealed text is completely hidden
set cursorline
set display=lastline
set fileformats=unix,mac,dos " Prefer Unix over Windows over OS 9 formats
set grepprg=grep\ -nH
set hidden
set hlsearch                 " Highlight found searches
set ignorecase               " Search case insensitive...
set iminsert=0
set imsearch=-1
set incsearch                " Shows the match while typing
set laststatus=2
set lazyredraw
"set listchars=eol:¬,tab:▸\
set list listchars=tab:\|\ 
set maxmempattern=20000      " increase max memory to show syntax highlighting for large files
set nocursorcolumn           " speed up syntax highlighting
set noerrorbells             " No beeps
set noimcmdline
set noimdisable
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set nosmartindent
set nrformats-=octal
set scrolloff=8
set shiftround
set shortmess+=c             " Shut off completion messages
set shortmess=acTI
set showcmd
set showmatch
set sidescroll=1
set sidescrolloff=16
set smartcase                " ... but not it begins with upper case
set splitbelow               " Split horizontal windows below to the current windows
set splitright               " Split vertical windows right to the current windows
set virtualedit=block
set wildmenu
set wrapscan
set wrap

"
"
"
" ============================== mapping ==============================
" let mapleader = "\<space>"
" let mapleader=";"
let mapleader=","
"
" I don't like it. Not easy to fzf current dir.
" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h
" map <Leader>cd :pwd<cr>
"map <Leader>wp :echo expand("%:p")<cr>
map <Leader>lc :lcd %:p:h<cr>
"
" Automatically resize screens to be equally the same
autocmd VimResized * wincmd =

"
" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nmap <silent> <leader>er :e $MYVIMRC<CR>
" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nmap <silent> <leader>re :source $MYVIMRC<CR>
"
"
imap  <C-T> <Esc>gUiwea
" imap  <C-T> <Esc>guiwea

imap <C-A> <Esc>I
imap <C-E> <END>
imap <C-O> <END><CR>

imap <C-D> <Left>
imap <C-F> <Right>


" Intuitive cursor movement in wrapped line
map j gj
map k gk
"
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nmap n nzzzv
nmap N Nzzzv
" Same when moving up and down
map <C-d> <C-d>zz
map <C-u> <C-u>zz

" Center the screen
nnoremap <space> zz
"
" Turn off the IME when escaping from Insert mode
imap <silent> <ESC> <ESC>:<C-u>set iminsert=0<CR>

" Switch active window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
" Close all but the current one
nmap <leader>o :only<CR>
"
"
" Refer to history in command-line mode
cmap <C-p> <Up>
" cmap <Up> <C-p>
cmap <C-n> <Down>
" cmap <Down> <C-n>
"
nnoremap <silent> <leader>wr :w<CR>
nnoremap <silent> <leader>q :q<CR>
" Remove search highlight
" nnoremap <leader><space> :nohlsearch<CR>
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

map P "*p
map Y "*y
"
" ============================== tab ==============================
nmap <silent> <leader>tn :tabnew<CR>
" ============================== buffer ==============================
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
"
" list buffers
" nn == nnoremap
"To define a mapping which will not be echoed on the command line, add
"<silent>" as the first argument. 
nmap <Leader>ls :ls<CR>
" list and select buffer
nmap <silent> <leader>bb<Space> :buffers<CR>:buffer<Space>

" go to next/previous buffer
" https://github.com/neovim/neovim/issues/2048
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
imap <C-n> <ESC>:bn<CR>
imap <C-p> <ESC>:bp<CR>

" Unload buffer and delete it from the buffer list.
nmap <silent> <leader>bd :bd<CR>
nmap <silent> <leader>bk :bd!<CR>
" first && last
nmap <silent> <leader>br :br<CR>
nmap <silent> <leader>bf :bf<CR>
nmap <silent> <leader>bl :bl<CR>

nmap <silent> <Leader>ma :marks<CR>

" ============================== explore ==============================
nmap <silent> <Leader>ex :Explore<CR>

nmap <silent> <leader>te :terminal<CR>
tmap <C-x> <C-\><C-n><C-w>q
" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tmap <Esc> <C-\><C-n>
" Terminal settings
if has('terminal')
" Kill job and close terminal window
tmap <Leader>q <C-w><C-C><C-w>c<cr>

" switch to normal mode with esc
tmap <Esc> <C-W>N

" mappings to move out from terminal to other views
tmap <C-h> <C-w>h
tmap <C-j> <C-w>j
tmap <C-k> <C-w>k
tmap <C-l> <C-w>l
endif

" https://www.reddit.com/r/neovim/comments/akcp97/how_to_automatically_enter_insert_mode_on_opening/
augroup insertonenter
	function! InsertOnTerminal()
		if &buftype ==# "terminal"
			normal i
		endif
	endfunction

	autocmd! BufEnter * call InsertOnTerminal()
	if has('nvim')
		autocmd! TermOpen * call InsertOnTerminal()
	endif
augroup END

" ============================== vim-go ==============================
" https://github.com/fatih/vim-go-tutorial
"let g:go_fmt_fail_silently = 1
"let g:go_fmt_command = "goimports"
"let g:go_debug_windows = {
"      \ 'vars':  'leftabove 35vnew',
"      \ 'stack': 'botright 10new',
"\ }

"let g:go_test_prepend_name = 1
"let g:go_list_type = "quickfix"
"let g:go_auto_type_info = 0

"let g:go_imports_mode = "gopls"
"let g:go_gopls_complete_unimported = 1

"let g:go_null_module_warning = 0
"let g:go_echo_command_info = 1

"let g:go_highlight_array_whitespace_error = 0
"let g:go_highlight_chan_whitespace_error = 0
"let g:go_highlight_extra_types = 1
"let g:go_highlight_space_tab_error = 0
"let g:go_highlight_trailing_whitespace_error = 0
"let g:go_highlight_operators = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_function_parameters = 1
"let g:go_highlight_function_calls = 1
"let g:go_highlight_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_generate_tags = 1
"let g:go_highlight_string_spellcheck = 1
"let g:go_highlight_format_strings = 1
"let g:go_highlight_variable_declarations = 1
"let g:go_highlight_variable_assignments = 1
"let g:go_highlight_diagnostic_errors = 1
"let g:go_highlight_diagnostic_warnings = 1
"let g:go_highlight_debug = 1

"let g:go_modifytags_transform = 'camelcase'
"" let g:go_fold_enable = []
""
"autocmd FileType go nmap <leader>bu  <Plug>(go-build)
"autocmd FileType go nmap <leader>ru <Plug>(go-run)
"autocmd FileType go nmap <leader>tt  <Plug>(go-test)
"
" ============================== ultisnips ==============================
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
"
" ============================== fzf ==============================
nnoremap <Leader>ff :FZF<Space>
nnoremap <Leader>fz :FZF<CR>
nnoremap <Leader>rg :Rg<space>
let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" " ============================== deoplete ==============================
" let g:deoplete#enable_at_startup = 1
" autocmd VimEnter * inoremap <expr> <cr> ((pumvisible()) ? (deoplete#close_popup()) : ("\<cr>"))
"
"

" " ============================== coc.nvim ==============================
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#next(1) :
"       \ CheckBackspace() ? "\<Tab>" :
"       \ coc#refresh()

" inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
inoremap <expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
"
"
"
" ============================== coc-snippets ==============================
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" ============================== linediff ==============================
let g:linediff_first_buffer_command = 'new'
let g:linediff_further_buffer_command = 'vertical new'

" ============================== tagbar ==============================
nmap <silent> <leader>wt :TagbarToggle<CR>
" https://github.com/jstemmer/gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }

" ============================== nerdtree ==============================
map <Leader>wn :NERDTreeToggle<cr>
map <Leader>nf :NERDTreeFind<cr>

let NERDTreeShowHidden=1
" Auto start NERD tree when opening a directory
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
" Auto start NERD tree if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif
" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
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
let g:NERDTreeGitStatusShowIgnored = 1
"

" ============================== delimitMate ==============================
" let g:delimitMate_expand_cr = 0   
" let g:delimitMate_expand_space = 1    
" let g:delimitMate_smart_quotes = 1    
" let g:delimitMate_expand_inside_quotes = 1
" let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   

" imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"


" ============================== vim-markdown ==============================
"gx: open the link under the cursor in the same browser as the standard gx command. 
"ge: open the link under the cursor in Vim for editing. Useful for relative markdown links. 
" ]], [[, ][, [], ]c, ]u
":Toc: create a quickfix vertical window navigable table of contents with the headers.
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['go=go', 'viml=vim', 'bash=sh']
let g:vim_markdown_conceal = 0
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
" }}}
"
"
" ============================== vim-easy-align ==============================
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ea <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)
" Align GitHub-flavored Markdown tables
" au FileType markdown vmap <Leader>alb :EasyAlign *<Bar><CR>
"
" ============================== easymotion ==============================
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
"
" ============================== vim-table-mode ==============================
" For Markdown-compatible tables use
let g:table_mode_corner='|'
" To get ReST-compatible tables use
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='
" 
"
" ============================== tabular ==============================
let g:tabular_loaded = 1
nmap <Leader>ta :Tabularize 
"
" ============================== vim-xkbswitch ==============================
if has('mac')
	let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
endif
let g:XkbSwitchEnabled = 1
"
" ============================== emmet-vim ==============================
let g:user_emmet_install_global = 0
autocmd FileType html,css,tmpl EmmetInstall

" ============================== choosewin ==============================
nmap W <Plug>(choosewin)

" ============================== vim-json ==============================
let g:vim_json_syntax_conceal = 0

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"
"
" ============================== airline ==============================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"
" ============================== color and theme ==============================
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"
" colorscheme iceberg
" let g:airline_theme='iceberg'
"

" colorscheme moonfly 			" it is weird.
" let g:airline_theme = 'moonfly'
"
"
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
let g:airline_theme = 'material'

set background=dark
colorscheme material

" let g:onedark_terminal_italics = 1
" colorscheme onedark
" let g:airline_theme='onedark'
"
"
"
" ============================== functiongs ==============================
