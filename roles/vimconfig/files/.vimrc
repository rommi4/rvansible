"Pathogen
execute pathogen#infect()
execute pathogen#helptags()

" ========================
" General settings
" ========================
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
"set mousemodel=popup

set ruler " show the line and column number of the cursor position, separated by comma
set completeopt-=preview " A comma separated list of options for Insert mode completion
set guicursor=a:blinkon0
set ttyfast



" color
color default
set background=dark
colorscheme solarized

"syntax check
syntax on
filetype plugin indent on
tab sball
set switchbuf=useopen
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '▲'
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" easytags
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1


"disable beeper and blinking
set visualbell t_vb=
set novisualbell


set enc=utf-8   "utf-8 by default

" Vim-Airline settings
set laststatus=2 "always show statusbar
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_detect_paste = 1
" let g:airline_theme='badwolf'
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'
let g:airline_theme='base16'
" let g:airline_left_sep='►'
" let g:airline_left_alt_sep='|'
" let g:airline_right_sep='◄'
" let g:airline_right_alt_sep='|'
" let g:airline_linecolumn_prefix = '¶ '
" let g:airline_fugitive_prefix = '⎇ '
" let g:airline_paste_symbol = 'ρ'


" TagBar settings
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus=0

" NerdTree settings
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

" TaskList settings
map <F2> :TaskList<CR>

"common stuff
set showmatch  " briefly jumt to the matching bracket
set matchtime=2 "tenths of a second to show the matching paren when 'showmatch' is set
set nocompatible
set hidden
set number " print the line number in front of each line
set magic  " Changes the special characters that can be used in search patterns
" set confirm "
set showcmd " Show (partial) command in the last line of the screen
set title
set nobackup          " no backup files
set autochdir " Vim will change the current working directory whenever you open a file
set wrap  " lines longer than the width of the window will wrap and displaying continues on the next line
set nolinebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set cmdheight=2
set noshowmode

"swap files
set noswapfile        " no swap files

set mouse=a

"case
set ignorecase
set smartcase

"indents
set autoindent
set nosmartindent    " set to 'no' due to #comments not to be intended

"tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

"tab completion stuff
set wildmenu
set wildmode=list:longest,full

"search
set hlsearch         "highlight search results
set incsearch        "incremental search
set nolazyredraw
set showmatch
set mat=2


"statusbar
set laststatus=2
set ttimeoutlen=50
set t_Co=256

"scroll
set scrolloff=5      "5 lines scroll for each time

"mappings
"tabs
map <A-Tab> :tabnext<CR>
nmap <A-t> :tabnew<CR>
nmap <A-w> :tabclose<CR>

nmap <leader>n :set invnumber<CR>

"motion
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap { {zz
nmap } }zz

imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i
imap <leader>{ {}<ESC>i
imap <leader>< <><ESC>i
imap <leader>< <><ESC>i

"swap split panels
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>


" ==========================
" Python-mode settings
" ==========================

let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_completion_on_dot = 0

" documentation
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" check code
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E265,E501,W601,C0110"

" check code after save
let g:pymode_lint_write = 1

" virtualenv support
let g:pymode_virtualenv = 1

" breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'


" syntax highlight
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" disable autofold
let g:pymode_folding = 1

" possibility to run code
let g:pymode_run = 0


" Disable choose first function/method at autocomplete
let g:jedi#popup_select_first = 0

" =============
" ANSIBLE & YML
" =============
autocmd BufNewFile,BufRead *.yml set filetype=ansible


" ============
" User hotkeys
" ============

" CTRL-SHIFT-C is for Copy
vnoremap <C-S-c> "+y

" run interpreter by F5
nnoremap <F5> :ConqueTermSplit ipython<CR>
" a debug-mode F6
nnoremap <F6> :ext "ConqueTermSplit ipython " . expand("%")<CR>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0

" Check code accordingly to PEP8 via <leader>8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<CR>

" Do not display docstring (jedi vim)
autocmd FileType python setlocal completeopt-=preview


" Autocomplecte via <Ctrl+Space>
inoremap <C-space> <C-x><C-o>

" -- airblade/vim-gitgutter settings --
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1
