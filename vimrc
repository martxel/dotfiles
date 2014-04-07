set nocompatible
filetype off

" LoadVundle()
" Install and load vundles
" from https://github.com/machuga/dotfiles
function! LoadVundle()
  let vundle_installed=filereadable(expand('~/.vim/bundle/vundle/README.md'))

  if vundle_installed == 0
    echo "Creating backups directory..."
    silent !mkdir -p ~/.vim/backups
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  endif

  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  " Bundle definitions

  Bundle 'gmarik/vundle'

  " Utils
  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-surround'
  Bundle 'scrooloose/syntastic'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'kien/ctrlp.vim'
  Bundle 'majutsushi/tagbar'
  Bundle 'ervandew/supertab'

  " Snippets
  Bundle 'SirVer/ultisnips'
  Bundle 'honza/vim-snippets'
  Bundle 'martxel/ultisnips-snippets'

  " Color schemes
  Bundle 'nanotech/jellybeans.vim'
  Bundle 'chriskempson/base16-vim'

  " Filetype related
  Bundle 'tpope/vim-rails'
  Bundle 'kchmck/vim-coffee-script'
  Bundle 'pangloss/vim-javascript'
  Bundle 'fatih/vim-go'
  Bundle 'othree/html5.vim'
  Bundle 'slim-template/vim-slim'
  Bundle 'Blackrush/vim-gocode'

  if vundle_installed==0
    echo vundle_installed
    echo "Vundle Installed, now Installing Bundles..."
    echo ""
    :BundleInstall
  endif

  filetype plugin indent on
endfunction

call LoadVundle()

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
colorscheme base16-tomorrow

" Always show status line
set laststatus=2

" Line numbers
set number
"set relativenumber
"autocmd InsertEnter * :set norelativenumber
"autocmd InsertLeave * :set relativenumber
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

"
" PLUGINS
"

" Syntastic
" Syntastic statusline format
let g:syntastic_stl_format = ' [%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}] '
" Passive mode
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': [] }

" Error and warning highlights
hi WarningMsg ctermbg=10 ctermfg=3
hi Warning ctermbg=10 ctermfg=3
hi ErrorMsg ctermbg=10 ctermfg=1
hi Error ctermbg=10 ctermfg=1
hi link SyntasticMsgWarningLine Warning
hi link SyntasticMsgWarningSign Warning
hi link SyntasticMsgWarning Warning
hi link SyntasticMsgErrorLine Error
hi link SyntasticMsgErrorSign Error
hi link SyntasticMsgError Error

" Supertab
let g:SuperTabDefaultCompletionType='context'

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"
" Custom mappings
"

" General
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>h :noh<CR>
nnoremap <leader>s :split .<CR>
nnoremap <leader>vs :vsplit .<CR>
nnoremap <leader>t :tabe .<CR>

" Syntastic
nnoremap <leader>c :w!<CR>:SyntasticCheck<CR>

" Ctags
nnoremap <leader>tc :call system('ctags')<CR>
nnoremap <leader>tt <C-]>
nnoremap <leader>bb <C-T>

" Tagbar
nnoremap <leader>tb :Tagbar<CR>

" Ctrlp
nnoremap <leader>f :CtrlP<CR><F5>
nnoremap <leader>b :CtrlPBuffer<CR><F5>

" Fugitive
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Git push<CR>

" Go
au Filetype go nnoremap <buffer> <leader>i :exe 'GoImport ' . expand('<cword>')<CR>
au Filetype go nnoremap <leader>r :GoRun %<CR>

"
" statusline
"
hi User1 ctermbg=10 ctermfg=250

set statusline=%1*
set statusline+=%F%m%r%h%w\ 
set statusline+=%{fugitive#statusline()}\ 
set statusline+=%=
set statusline+=%#errormsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%1*
set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
set statusline+=\ [line\ %l\/%L]
