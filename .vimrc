" Setup Folds {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" vim-plug Plugins {{{
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" macOS {{{
if has("mac")
Plug 'lyokha/vim-xkbswitch'
endif
" }}}
" vim-go {{{
 Plug 'fatih/vim-go', {  'do': ':GoUpdateBinaries' }
 Plug 'AndrewRadev/splitjoin.vim'
" }}}
" lsp {{{
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" }}}
" auto complete {{{
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
" }}}
" ultisnips {{{
 Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
 Plug 'honza/vim-snippets'
" }}}
" fzf {{{
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" }}}
" tagbar {{{
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
" }}}
" miscs {{{
" vim-bracketed-paste enables transparent pasting into vim. (i.e. no more :set paste!)
Plug 'ConradIrwin/vim-bracketed-paste'
" This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.,
Plug 'dhruvasagar/vim-table-mode'
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. 
" cs"', cst"(total), ds"(delete), etc.
" Plug 'tpope/vim-surround'
" gc, gc<motion>, gcap
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'justinmk/vim-sneak'
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'plasticboy/vim-markdown'
Plug 'mattn/emmet-vim'
Plug 'junegunn/goyo.vim'
" Plug 'tommcdo/vim-lion'
" }}}
" colorscheme {{{
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'nordtheme/vim', {'tags': '0.19.0', 'as': 'nordtheme'}
" Plug 'jacoborus/tender.vim'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Plug 'edkolev/tmuxline.vim'
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'joshdick/onedark.vim'
" Plug 'ayu-theme/ayu-vim'
" Plug 'gkeep/iceberg-dark'
" plug 'nlknguyen/papercolor-theme'
" plug 'bluz71/vim-moonfly-colors'
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
" Plug 'joshdick/onedark.vim'
" Plug 'connorholyday/vim-snazzy' 			" not clear
" Plug 'sonph/onehalf' 						" buggy
" Plug 'tyrannicaltoucan/vim-deep-space'
" Plug 'endel/vim-github-colorscheme'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'bling/vim-bufferline'
" Plug 'catppuccin/vim', { 'as': 'catppuccin' }
" Plug 'cocopon/iceberg.vim',
" }}}
call plug#end()
" }}}
"---------------------------------------------------------------------------------------------------------------------------------------------------------
" Settings {{{
" colorscheme {{{
" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

set background=dark

" let g:material_terminal_italics = 1
" let g:material_theme_style = 'palenight-community'
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker' | 'default-community' | 'palenight-community' | 'ocean-community' | 'lighter-community' | 'darker-community'
" colorscheme material
colorscheme nord
" vim.cmd.colorscheme "catppuccin-mocha"
" colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" let g:airline_theme = 'catppuccin'
" }}}
set nocompatible
set nobackup                 " Don't create annoying backup files
set nowritebackup
set autowrite                " Automatically save before :next, :make etc.
set noswapfile               " Don't use swapfile
set mouse=                   " Disable mouse mode
" set listchars=eol:¬,tab:▸\
" set list listchars=tab:»-,trail:·,extends:»,precedes:«
" set list listchars=tab:\|\ 


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

set updatetime=100

" To get hover working in the terminal we need to set ttymouse. See
"
" :help ttymouse
"
" for the appropriate setting for your terminal. Note that despite the
" automated tests using xterm as the terminal, a setting of ttymouse=xterm
" does not work correctly beyond a certain column number (citation needed)
" hence we use ttymouse=sgr
set ttymouse=sgr

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
filetype indent on
set autoindent
set smartindent

" Suggestion: define sensible backspace behaviour. See :help backspace for
" more details
set backspace=2

scriptencoding utf-8
set encoding=utf-8
set number                   " Show line numbers
set shiftwidth=4 softtabstop=4 
set noexpandtab


set belloff+=ctrlg           " If Vim beeps during completion
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
set lazyredraw
set maxmempattern=20000      " increase max memory to show syntax highlighting for large files
set nocursorcolumn           " speed up syntax highlighting
set noerrorbells             " No beeps
set noimcmdline
set noimdisable
set noshowmatch              " Do not show matching brackets by flickering
set showmode               
set nosmartindent
set nrformats-=octal
set scrolloff=5              " Minimal number of screen lines to keep above and below the cursor.
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

set foldmethod=syntax
" }}}
" Mappings {{{
" leader {{{
" let mapleader = "\<space>"
" let mapleader=";"
let mapleader=","
nn \ ,
" }}}
" help page {{{
nn <leader>H :tab h<space>
" }}}
"
" Automatically resize screens to be equally the same
autocmd VimResized * wincmd =
"
" vimrc {{{
" Shortcut to edit THIS configuration file
nn <silent> <leader>er :tabnew $MYVIMRC<CR>
" Shortcut to source (reload) THIS configuration file after editing it
nn <silent> <leader>re :source $MYVIMRC<CR>
" }}}

" Intuitive cursor movement in wrapped line
nn j gj
nn k gk
"
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nn n nzzzv
nn N Nzzzv

" Editing {{{

" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h
" map <leader>cd :pwd<cr>
"map <leader>wp :echo expand("%:p")<cr>
nn <leader>lcd :lcd %:p:h<cr>:pwd<cr>
nn <leader>cd :cd %:p:h<cr>:pwd<cr>

ino "" ""<left>
ino '' ''<left>
ino () ()<left>
ino [] []<left>
ino {} {}<left>
ino (<cr> (<CR>)<C-o>O
ino {<cr> {<CR>}<C-o>O
ino [<cr> [<CR>]<C-o>O
" }}}
" CommandLine {{{
" Refer to history in command-line mode
cno <C-p> <Up>
" cmap <Up> <C-p>
cno <C-n> <Down>
" cmap <Down> <C-n>
" }}}
" registers {{{

" map <leader>P "*p
" map <leader>Y "*y
nn Y y$
"
"" reverse word
vn <leader>rw c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" clear highlight
nn <leader><space> :noh<CR>

nn <leader>ju :jumps<CR>
nn <leader>ma :marks<CR>
" }}}
"
" tabs {{{
nn <leader>to :tabonly<CR>
nn <leader>tx :tabclose<CR>
nn <leader>ts :tabs<CR>
nn <leader>tn :tabnew<CR>
nn <leader>tf :tabfirst<CR>
nn <leader>tl :tablast<CR>
nn <leader>t<space> :tab 
nn <leader>t2 :tab 2<cr>
nn <leader>t3 :tab 3<cr>
nn <leader>tm :tabmove<Space>
nn <leader>tt :tabmove -1<CR>
nn <leader>ty :tabmove +1<CR>
nn <leader>t^ :tabmove 0<CR>
nn <leader>t$ :tabmove $<CR>

nn gp gT
" }}}

" windows {{{
nn <silent> <leader>w :update<CR>
nn <silent> <leader>W :wa<CR>
nn <silent> <leader>x :x<CR>
nn <silent> <leader>X :xa<CR>
nn <leader>q :q<CR>
nn <leader>Q :qa<CR>

" }}}
" buffers {{{

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
nn <leader>ls :ls<CR>
" list and select buffer
nn <silent> <leader>b<Space> :buffers<CR>:buffer<Space>

" go to next/previous buffer
nn <C-n> :bn<CR>
nn <C-p> :bp<CR>
ino <C-n> <ESC>:bn<CR>
ino <C-p> <ESC>:bp<CR>
nn <silent> <leader>bn :bn<CR>
nn <silent> <leader>bp :bp<CR>

" Unload buffer and delete it from the buffer list.
nn <silent> <leader>bd :bd<CR>
nn <silent> <leader>bu :bu<CR>
nn <silent> <leader>bk :bd!<CR>
" first && last
nn <silent> <leader>br :br<CR>
nn <silent> <leader>b1 :bf<CR>
nn <silent> <leader>bl :bl<CR>
" }}}
" terminal {{{
nn <silent> <leader>te :tab terminal<CR>
tno <C-x> <C-\><C-n><C-w>q
" improved keyboard support for navigation (especially terminal)
" https://neovim.io/doc/user/nvim_terminal_emulator.html
tno <Esc> <C-\><C-n>
" Terminal settings
if has('terminal')
" Kill job and close terminal window
tno <leader>q <C-w><C-C><C-w>c<cr>

" switch to normal mode with esc
tno <Esc> <C-W>N

" mappings to move out from terminal to other views
tno <C-h> <C-w>h
tno <C-j> <C-w>j
tno <C-k> <C-w>k
tno <C-l> <C-w>l
endif

" https://www.reddit.com/r/neovim/comments/akcp97/how_to_automatically_enter_insert_mode_on_opening/
augroup insertonenter
	function! InsertOnTerminal()
		if &buftype ==# "terminal"
			normal i
		endif
	endfunction

	autocmd! BufEnter * call InsertOnTerminal()
augroup END
" }}}
" compile {{{
nn <leader>mk :tab :make<CR>
" }}}
" }}}
" augroup tabstop_settings {{{
augroup tabstop_settings
    autocmd!
    autocmd BufNewFile,BufRead *.{yml,yaml,tmpl,html} setlocal expandtab softtabstop=2 shiftwidth=2 
    autocmd BufNewFile,BufRead *.{tmpl,html} setlocal expandtab softtabstop=4 shiftwidth=4 
    autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
augroup END
" }}}
"---------------------------------------------------------------------------------------------------------------------------------------------------------
" Plugins Configs {{{
"
" fzf {{{
nn <leader>fs :Files<CR>
nn <leader>ht :History:<CR>
nn <leader>f<space> :Files<Space>
nn <leader>fh :Files ~<CR>
nn <leader>fc :Files ~/.config/<CR>
nn <leader>fv :Files ~/.vim/<CR>
nn <leader>rg :Rg<CR>
nn <leader>ta :Tags<space>
nn <leader>sn :Snippets<CR>

let g:fzf_layout = { 'down': '~20%' }

let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*,tags,.DS_Store" '

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)
" }}}

" vim-sneak {{{
let g:sneak#label = 1
" " 2-character Sneak (default)
" nmap <leader>s <Plug>Sneak_s
" nmap <leader>S <Plug>Sneak_S
" " visual-mode
" xmap <leader>s <Plug>Sneak_s
" xmap <leader>S <Plug>Sneak_S
" " operator-pending-mode
" omap <leader>s <Plug>Sneak_s
" omap <leader>S <Plug>Sneak_S
" }}}

" vim-go {{{

" autocmd FileType go nmap <leader>gb  <Plug>(go-build)
" autocmd FileType go nmap <leader>gr  <Plug>(go-run)
" autocmd FileType go nmap <leader>gt  <Plug>(go-test)
" autocmd FileType go nmap <leader>gc <Plug>(go-coverage-toggle)

let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_build_constraints = 1

let g:go_highlight_functions = 1
" let g:go_highlight_functions_parameters = 1
let g:go_highlight_function_calls = 1

" let g:go_highlight_operators = 1

let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" let g:go_auto_type_info = 0

" let g:go_doc_popup_window = 1
" let g:go_doc_balloon = 1

" let g:go_term_enabled = 0
" }}}

" asynccomplete {{{

set completeopt=menuone,noinsert,noselect,preview
set completeopt+=popup
set completepopup=align:menu,border:off,highlight:Pmenu

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

ino <silent><expr> <C-n>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<C-n>" :
  \ asyncomplete#force_refresh()
ino <expr><C-p> pumvisible() ? "\<C-p>" : "\<C-p>"

ino <expr> <cr> pumvisible() ? asyncomplete#close_popup() : "\<cr>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

" }}}

" vim-lsp {{{

let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_insert_mode_enabled = 0
let g:lsp_diagnostics_virtual_text_align = "right"


let g:lsp_diagnostics_echo_cursor = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gD <plug>(lsp-type-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" vim-lsp-settings
let g:lsp_settings_root_markers = [
\   '.git/'
\ ]

" }}}

" tagbar {{{
" This value can also be set using the |winwidth(0)| function call to calculate
" a dynamic value to make the tagbar width relative to a percentage of the vim
" window size as seen in the example below that will open the tagbar window to
" 20 percent of the window width with a limit of no less than 25 characters.
let g:tagbar_width = max([25, winwidth(0) / 5])


nm <silent> <leader>T :TagbarToggle<CR>
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
		\ 'n' : 'ntype'. "\<cr>" 
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
	\ }

" }}}

" ultisnips {{{
let g:UltiSnipsExpandOrJumpTrigger = "<tab>"
" }}}
" vim-markdown {{{
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
" vim-table-mode {{{
" For Markdown-compatible tables use
let g:table_mode_corner='|'
" To get ReST-compatible tables use
" let g:table_mode_corner_corner='+'
" let g:table_mode_header_fillchar='='
" }}}
" emmet-vim {{{
let g:user_emmet_leader_key = '<C-y>'
let g:user_emmet_install_global = 0
autocmd FileType html,css,gohtmltmpl EmmetInstall
" }}}
" vim-json {{{
let g:vim_json_syntax_conceal = 0
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}
" vim-xkbswitch {{{
" Must Use Input Source Switcher.
if has("mac")
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled = 1
let g:airline_detect_iminsert = 1
endif
" }}}
" goyo {{{
nn <leader>gy :Goyo<CR>
nn <leader>yg :Goyo!<CR>
" }}}
" vim-rsi {{{
let g:rsi_no_meta = 1
" }}}
" }}}
