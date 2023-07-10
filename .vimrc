" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" ============================== indent-guides ==============================
" Plug 'preservim/vim-indent-guides'
"set listchars=eol:¬,tab:▸\
set list listchars=tab:\|\ 
" set list listchars=tab:»-,trail:·,extends:»,precedes:«

" ============================== vim-go ==============================
Plug 'fatih/vim-go', {  'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'thomasfaingnaert/vim-lsp-ultisnips'
" Plug 'jaxbot/semantic-highlight.vim'

" ============================== ultisnips ==============================
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"
" ============================== fzf ==============================
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"
" ============================== ale ==============================
" Plug 'dense-analysis/ale'
"
"
" ============================== coc.nvim ==============================
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" Plug 'Raimondi/delimitMate'
" https://github.com/godlygeek/tabular
Plug 'godlygeek/tabular'
" A simple, easy-to-use Vim alignment plugin.
Plug 'junegunn/vim-easy-align'
Plug 'dhruvasagar/vim-table-mode'
" Surround.vim is all about "surroundings": parentheses, brackets, quotes, XML tags, and more. 
" cs"', cst"(total), ds"(delete), etc.
"Plug 'tpope/vim-surround'
" gc, gc<motion>, gcap
Plug 'tpope/vim-commentary'
Plug 'hashivim/vim-hashicorp-tools'
Plug 'tpope/vim-repeat'

" ============================== vim-sneak ==============================
Plug 'justinmk/vim-sneak'
'
"
" ============================== specific ==============================
Plug 'cespare/vim-toml'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'ekalinin/Dockerfile.vim', {'for' : 'Dockerfile'}
Plug 'corylanou/vim-present', {'for' : 'present'}
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'andrewstuart/vim-kubernetes'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-haml'
"

" ============================== vim-airline ==============================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ============================== goyo ==============================
Plug 'junegunn/goyo.vim'

" ============================== vim-xkbswitch =============================
if has("mac")
Plug 'lyokha/vim-xkbswitch'
endif

" ============================== colorscheme ==============================
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'nordtheme/vim'
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

call plug#end()
"
"
" ============================== leader ==============================
" let mapleader = "\<space>"
" let mapleader=";"
let mapleader=","
noremap \ ,


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
set autowrite                " Automatically save before :next, :make etc.
set noswapfile               " Don't use swapfile
set mouse=a                  " Enable mouse mode

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

set autoindent
set smartindent
filetype indent on

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
" ============================== mappings ==============================
nmap <leader>vm :verbose map<space>
"

" ============================== help ==============================
nmap <Leader>H :tab h<space>
nmap <Leader>hm :tab help user-manual<CR>
"
" Automatically resize screens to be equally the same
autocmd VimResized * wincmd =

"
" Shortcut to edit THIS configuration file
nmap <silent> <leader>er :tabnew $MYVIMRC<CR>
" Shortcut to source (reload) THIS configuration file after editing it
nmap <silent> <leader>re :source $MYVIMRC<CR>
"

" Intuitive cursor movement in wrapped line
map j gj
map k gk
"
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nmap n nzzzv
nmap N Nzzzv
 
" Turn off the IME when escaping from Insert mode
" imap <silent> <ESC> <ESC>:<C-u>set iminsert=0<CR>

" ============================== editing ==============================
nmap <silent> <leader>w :update<CR>
nmap <silent> <leader>W :wall<CR>

" Enter automatically into the files directory
" autocmd BufEnter * silent! lcd %:p:h
" map <Leader>cd :pwd<cr>
"map <Leader>wp :echo expand("%:p")<cr>
nmap <Leader>lcd :lcd %:p:h<cr>:pwd<cr>
nmap <leader>cd :cd %:p:h<cr>:pwd<cr>

inoremap (<cr> (<CR>)<C-c>O
inoremap {<cr> {<CR>}<C-c>O
inoremap [<cr> [<CR>]<C-c>O

" ============================== commandline =========================
" Refer to history in command-line mode
cmap <C-p> <Up>
" cmap <Up> <C-p>
cmap <C-n> <Down>
" cmap <Down> <C-n>

" ============================== windows ==============================
" Switch active window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

nmap <silent> <leader>x :close<cr>

" ============================== tabs ==============================
nmap <leader>x :tabclose<CR>

nmap <leader>ta :tabs<CR>
nmap <leader>t<space> :tab 
nmap <leader>tn :tabnew<CR>
nmap <leader>tf :tabfind<space>
nmap <leader>tr :tabrewind<CR>
nmap <leader>tl :tablast<CR>
nmap <leader>to :tabonly<CR>
nmap <leader>tm :tabmove<Space>
nmap <leader>t^ :tabmove 0<CR>
nmap <leader>t$ :tabmove $<CR>

nmap gp gT

" ============================== registers ==============================
" map <leader>P "*p
" map <leader>Y "*y
map Y y$
"
"" reverse word
vnoremap <Leader>r c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" clear highlight
nmap <leader><space> :noh<CR>

nmap <leader>J :jumps<CR>
nmap <leader>M :marks<CR>

" ============================== buffers ==============================
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
" nmap <Leader>B :buffers<CR>
" list and select buffer
nmap <silent> <leader>b<Space> :buffers<CR>:buffer<Space>

" go to next/previous buffer
" https://github.com/neovim/neovim/issues/2048
nmap <C-n> :bn<CR>
nmap <C-p> :bp<CR>
imap <C-n> <ESC>:bn<CR>
imap <C-p> <ESC>:bp<CR>

" Unload buffer and delete it from the buffer list.
nmap <silent> <leader>bd :bd<CR>
nmap <silent> <leader>bu :bu<CR>
nmap <silent> <leader>bk :bd!<CR>
" first && last
nmap <silent> <leader>br :br<CR>
nmap <silent> <leader>b1 :bf<CR>
nmap <silent> <leader>bl :bl<CR>

" ============================== terminal ==============================
nmap <silent> <leader>te :tab terminal<CR>
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
augroup END

"
" ============================== functiongs ==============================
" autocmd VimEnter,VimLeave * silent !tmux set status
"
" ============================== ultisnips ==============================
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"
" let g:UltiSnipsExpandTrigger               <tab>
" let g:UltiSnipsListSnippets                <c-tab>
" let g:UltiSnipsJumpForwardTrigger          <c-j>
" let g:UltiSnipsJumpBackwardTrigger         <c-k>
"
" ============================== fzf ==============================
nnoremap <Leader>fe :History:<CR>
nnoremap <Leader>f<space> :FZF<Space>
nnoremap <Leader>fh :FZF ~<CR>
nnoremap <Leader>fc :FZF ~/.config/<CR>
nnoremap <Leader>F :FZF<CR>
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


" ============================== vim-sneak ==============================
let g:sneak#label = 1
" 2-character Sneak (default)
nmap <leader>s <Plug>Sneak_s
nmap <leader>S <Plug>Sneak_S
" visual-mode
xmap <leader>s <Plug>Sneak_s
xmap <leader>S <Plug>Sneak_S
" operator-pending-mode
omap <leader>s <Plug>Sneak_s
omap <leader>S <Plug>Sneak_S

"
" ============================== FileType ==============================
autocmd BufNewFile,BufRead *.{yml,yaml} setlocal expandtab softtabstop=2 shiftwidth=2 


" ============================== indent-guides ==============================
let g:indent_guides_enable_on_vim_startup = 0
"
" ============================== vim-go ==============================
autocmd FileType go nmap <leader>gb  <Plug>(go-build)
autocmd FileType go nmap <leader>gr  <Plug>(go-run)
autocmd FileType go nmap <leader>gt  <Plug>(go-test)
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1

let g:go_highlight_functions = 1
let g:go_highlight_functions_parameters = 1
let g:go_highlight_function_calls = 1

let g:go_highlight_operators = 1

let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 0

let g:go_doc_popup_window = 1
let g:go_doc_balloon = 1

let g:go_term_enabled = 0

" let g:go_def_mapping_enabled = 0
"


" ============================== asyncomplete.vim =======================
" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"   \ pumvisible() ? "\<C-n>" :
"   \ <SID>check_back_space() ? "\<TAB>" :
"   \ asyncomplete#force_refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
"
set completeopt=menuone,noinsert,noselect,preview
set completeopt+=popup
set completepopup=align:menu,border:off,highlight:Pmenu
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

au User asynccomplete_setup  call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
    \ 'name': 'ultisnips',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
    \ }))


" ============================== vim-lsp =======================
let g:lsp_use_lua = 1
let g:lsp_use_native_client = 1
let g:lsp_semantic_enabled = 1

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 0
let g:lsp_diagnostics_float_cursor = 0
let g:lsp_diagnostics_float_insert_mode_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0

let g:lsp_inlay_hints_enabled = 0
" let g:lsp_inlay_hints_mode = {
" \  'normal': ['curline'],
" \}



augroup LspGo
  au!
  autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'go-lang',
      \ 'cmd': {server_info->['gopls']},
      \ 'whitelist': ['go'],
      \ })
  autocmd FileType go setlocal omnifunc=lsp#complete
  autocmd FileType go nmap <buffer> <leader>ne <plug>(lsp-next-error)
  autocmd FileType go nmap <buffer> <leader>nw <plug>(lsp-next-warning)
  autocmd FileType go nmap <buffer> <leader>pe <plug>(lsp-previous-error)
  autocmd FileType go nmap <buffer> <leader>pw <plug>(lsp-previous-warning)
  autocmd FileType go nmap <buffer> K <plug>(lsp-hover-float)
  " autocmd CursorHold,CursorHoldI *.go LspHover
augroup END

" call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
"     \ 'name': 'gocode',
"     \ 'allowlist': ['go'],
"     \ 'completor': function('asyncomplete#sources#gocode#completor'),
"     \ 'config': {
"     \    'gocode_path': expand('~/go/bin/gocode')
"     \  },
"     \ }))

" call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
" 	\ 'name': 'omni',
" 	\ 'whitelist': ['go'],
" 	\ 'completor': function('asyncomplete#sources#omni#completor')
" 	\  }))

" " ============================== coc.nvim ==============================
" inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" " use <tab> for trigger completion and navigate to the next complete item
" function! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " inoremap <silent><expr> <Tab>
" "       \ coc#pum#visible() ? coc#pum#next(1) :
" "       \ CheckBackspace() ? "\<Tab>" :
" "       \ coc#refresh()

" " inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" inoremap <expr> <C-n> coc#pum#visible() ? coc#pum#next(1) : "\<C-n>"
" inoremap <expr> <C-p> coc#pum#visible() ? coc#pum#prev(1) : "\<C-p>"
"
"
"
" ============================== coc-snippets ==============================
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ CheckBackSpace() ? "\<TAB>" :
"       \ coc#refresh()

" function! CheckBackSpace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:coc_snippet_next = '<tab>'

" ============================== linediff ==============================
let g:linediff_first_buffer_command = 'new'
let g:linediff_further_buffer_command = 'vertical new'

" ============================== tagbar ==============================
nmap <silent> <leader>T :TagbarToggle<CR>
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
nmap <leader>nk :NERDTreeFocus<CR>
nmap <leader>nd :NERDTree<CR>
nmap <leader>N :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>

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
" let g:delimitMate_expand_cr = 1   
" let g:delimitMate_expand_space = 1    
" let g:delimitMate_smart_quotes = 1    
" let g:delimitMate_expand_inside_quotes = 1
" let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'   
" let delimitMate_matchpairs = "(:),[:],{:},<:>"
" au FileType vim,html let b:delimitMate_matchpairs = "(:),[:],{:},<:>"

" imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
" imap <Backspace> <Plug>delimitMateBS
" imap <S-Backspace> <Plug>delimitMateS-BS
" imap <S-Tab> <Plug>delimitMateS-Tab
" imap <CTRL-G>_g <Plug>delimitMateJumpMany



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
"
" ============================== emmet-vim ==============================
let g:user_emmet_install_global = 0
autocmd FileType html,css,tmpl EmmetInstall

" ============================== vim-json ==============================
let g:vim_json_syntax_conceal = 0

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"
"
" ============================== airline ==============================
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"
" ============================== vim-xkbswitch ==============================
" Must Use Input Source Switcher.
if has("mac")
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
let g:XkbSwitchEnabled = 1
let g:airline_detect_iminsert = 1
endif

" ============================== goyo ==============================
map <leader>gy :Goyo<CR>
map <leader>yg :Goyo!<CR>

" ============================== vim-airline ==============================
let g:airline#extensions#bufferline#enabled = 1
"
" ============================== colorscheme ==============================
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
let g:airline_theme='nord'

" vim.cmd.colorscheme "catppuccin-mocha"
" colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
" let g:airline_theme = 'catppuccin'

"
" ============================== functions ==============================
