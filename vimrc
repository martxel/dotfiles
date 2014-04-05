set nocompatible

" Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Filetype plugins
filetype plugin indent on

" Autoread changes
set autoread

" Map leader
let mapleader = ' '
let g:mapleader = ' '

" Window movement
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Search
" map <space> /
" map <c-space> ?

" Syntax highlighting
syntax enable
set background=dark
colorscheme jellybeans

" Always show status line
set laststatus=2

" Line numbers
set number
set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
set numberwidth=3

" Show current position
set ruler

" Buffers hidden when abandoned
set hidden

" History lines to remember
set history=100

" Show command in the last line of the screen
set showcmd

" Height of command bar
set cmdheight=2

" Highlight current line
set cursorline

" Cursor lines when moving vertically
set scrolloff=10

" Ignore case when searching
set ignorecase

" Be smart with cases when searching
set smartcase

" Highlight search results
set hlsearch

" Incremental search
set incsearch

" Don't redraw while executing macros (good performance)
set lazyredraw

" Magic for regular expressions
set magic

" Wild menu
set wildmenu

" Show matching brackets
set showmatch

" Blink for 4 tenths of a second when matching brackets
set matchtime=4

" Mouse support in normal mode
" set mouse=n

" Indentation
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set wrap

" Indentation by filetype
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType c setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab
autocmd FileType go setlocal shiftwidth=2 tabstop=2 noexpandtab
autocmd FileType snippets setlocal shiftwidth=2 tabstop=2 noexpandtab

" Display extra whitespace
set listchars=tab:»·,trail:·
set list

" Backspace
set backspace=indent,eol,start

" Move to previous/next line when cursor is on the first/last character
set whichwrap+=<,>,h,l

" 80 char lines
set linebreak
set textwidth=80
set colorcolumn=81

" UTF-8 encoding
set encoding=utf8

" Unix default filetype
set fileformats=unix,dos,mac

" No backups
set nobackup
set nowritebackup
set noswapfile

" No error sounds
set noerrorbells

" No visual bell
set novisualbell
set t_vb=

" Timeout for key sequence completion
set timeoutlen=500

" Behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%

" Return to last edit position when opening files
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif


" Don't close window when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Omni completion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1

" Close omni completion preview window on movement in I mode or
" when leaving I mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" PLUGINS

" syntastic
" status line format
let g:syntastic_stl_format = ' %E{Err: %fe #%e}%B{ | }%W{Warn: %fw #%w} '
" passive mode
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" vim-airline
let g:airline_enable_branch=1
let g:airline_branch_empty_message='no branch'
let g:airline_enable_syntastic=1
let g:airline_enable_tagbar=1
let g:airline_theme='jellybeans'
let g:airline_powerline_fonts=1
" vim-airline - custom colors for syntastic and warnings
hi WarningMsg term=standout ctermbg=236
" vim-airline - avoid delay from I to N mode
set ttimeoutlen=50

" supertab
let g:SuperTabDefaultCompletionType='context'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" Custom mappings

" general
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>s :split .<CR>
nnoremap <leader>vs :vsplit .<CR>
nnoremap <leader>t :tabe .<CR>

" syntastic
nnoremap <leader>c :w!<CR>:SyntasticCheck<CR>

" ctags
nnoremap <leader>tc :call system('ctags')<CR>
nnoremap <leader>tt <C-]>
nnoremap <leader>bb <C-T>

" tagbar
nnoremap <leader>tb :Tagbar<CR>

" ctrlp
nnoremap <leader>f :CtrlP<CR><F5>
nnoremap <leader>b :CtrlPBuffer<CR><F5>

" fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>

" go
au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>
au Filetype go nnoremap <leader>r :GoRun %<CR>
