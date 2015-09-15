"        _              
"  _  __(_)_ _  ________
" | |/ / /  ' \/ __/ __/
" |___/_/_/_/_/_/  \__/ 
"                      

" Powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2                " Always display the statusline in all windows
set showtabline=2               " Always display the tabline, even if there is only one tab
set noshowmode                  " Hide the default mode text (e.g. -- INSERT -- below the statusline)

let $JS_CMD = 'node'
let mapleader = ','
let maplocalleader = ','

let g:netrw_liststyle=3

set nocompatible                " Don't care about Vi-compatibility
scriptencoding utf-8            " Character encoding
set encoding=utf8
set mouse=                      " Disabling mouse support
set modelines=0
set backspace=indent,eol,start  " Backspace for dummies?
set autoread                    " Autoread a file when it's changed from outside

set complete+=kspell

set history=1000                " Remember ALL THE commands!
set undolevels=1000             " Do ALL THE undo's!
set undoreload=10000            " Maximum number lines to save for undo on a buffer reload

set ttyfast                     " Smoother terminal connection
set nospell                     " Disable spell checking basically
set hidden                      " Change buffer without saving
set magic                       " Better searching

set noswapfile                  " Don't pollute my hard drive, even temporary
set lazyredraw
set whichwrap=b,s

set cryptmethod=blowfish        " Use strong blowfish algorithm when encrypting files

call plug#begin('~/.vim/plugged')

Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'sjl/badwolf'
Plug 'noahfrederick/vim-hemisu'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rails'
Plug 'mileszs/ack.vim'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mattn/emmet-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'chase/vim-ansible-yaml'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'wincent/command-t'
Plug 'vim-scripts/avr.vim'
Plug 'klen/python-mode'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dag/vim-fish'
" Plug 'Valloric/YouCompleteMe'

call plug#end()

set guioptions=TlrLR
set t_Co=256
set shell=bash

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

set background=dark
colorscheme badwolf
syntax on

set list
set listchars-=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail
set relativenumber

set scrolljump=5
set scrolloff=3

set wildmenu                                      " Enable wild menu
set wildmode=list:longest,full
set wildignore+=.git,.svn                         " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg    " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest  " compiled object files
set wildignore+=*.sw?                             " Vim swap files
set wildignore+=*.DS_Store                        " OSX bullshit
set wildignore+=*.zip                             " zip

set showmatch                                     " Show matching brackets (Damn this is so cool!)
set matchtime=3

set incsearch
set hlsearch
set ignorecase                                    " Case insensitive search
set smartcase                                     " Case sensitive when uc present

set statusline=%f\ %m\ %r%=\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

set showcmd
set showmode                                      " Show current mode on commandline
set cmdheight=2                                   " The commandline height
set shortmess+=filmnrxoOtT                        " Short messaging in commandline
set laststatus=2                                  " Windows always will have a status line

set cursorline                                    " Highlight cursorline!
set ruler                                         " Always show current position

highlight ColorColumn ctermbg=blue
call matchadd('ColorColumn', '\%81v', 100)

set virtualedit=onemore                           " Allow for cursor beyond last character

" set foldlevelstart=0
" set foldenable

set wrap
set autoindent
set smartindent

set shiftround
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set smarttab

set tw=500                                        " Set text width
set formatoptions=qrn1

set noerrorbells
set visualbell
set t_vb=

" set winwidth=84
" set winheight=5
" set winminheight=5
" set winheight=999

set splitbelow                                    " Split current window below
set splitright                                    " Split current window right
set title

"NERDTree config
set autochdir
let NERDTreeChDirMode=2
nnoremap <leader>n :NERDTree .<CR>
nmap <F8> :TagbarToggle<CR>
map <F2> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_html_checkers = []
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs=1

" Ctrl p
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = {'dir': 'dist'}

" Python mode config
let g:pymode_rope = 0 "Replaced by jedi-vim
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
" Syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0

" Open up .vimrc quickly in a new buffer
nnoremap  <leader>ev :vsp $MYVIMRC<cr>
" Source .vimrc explitly
nnoremap  <leader>sv :source $MYVIMRC<cr>
" Ex-mode is shitty
nnoremap  Q <nop>
" Fast saving
nnoremap <leader>w :w!<cr>
" e2e matching
nnoremap <tab> %
vnoremap <tab> %
" Folding
nnoremap <Space> za
vnoremap <Space> za
" Remove trailing whitespaces
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>
" Use vim way instead
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" easy expansion
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h') . '/' : '%%'

" Disabling arrow keys in normal and insert mode
nnoremap  <up> <nop>
nnoremap  <down> <nop>
nnoremap  <left> <nop>
nnoremap  <right> <nop>
inoremap  <up> <nop>
inoremap  <down> <nop>
inoremap  <left> <nop>
inoremap  <right> <nop>
" insert equals sign for faster assignments
inoremap <c-l> <space>=<space>
" I write a lot of unit tests, is this a very handy mapping
" when writing it() blocks
inoremap <c-f> function () {<cr>});<esc>O
" Disable arrow keys in command mode
cnoremap <Up> <nop>
cnoremap <Down> <nop>

nnoremap J jo

nnoremap j gj
nnoremap k gk
" nnoremap ; :
" nnoremap : ;

" faster movement
nmap J 5j
nmap K 5k
xmap J 5j
xmap K 5k

" Disabling escape key. It's too far away!
inoremap  <esc> <nop>
" `jj` is much better :)
inoremap  jj <esc>
" Search for non breaking spaces (ascii 160) Thank you Stø!
nnoremap <leader>hw :/\%xa0<cr>

" Keep search pattern at the center of the screen
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
nnoremap <silent> g# g#zz

nnoremap <leader>vn :30vsp ~/Dropbox/notes/vim-notes.txt<cr>
" Use just CTRL instead of CTRL-W to switch between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader><space> :Goyo<cr>

" This rewires n and N to do the highlighing...
nnoremap <silent> n   n:call HLNext(0.2)<cr>
nnoremap <silent> N   N:call HLNext(0.2)<cr>

cnoreabbrev q qall!
cnoreabbrev Q qall!
cnoreabbrev qalL qall!
cnoreabbrev Qall qall!

inoreabbrev zipyy zippy

" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
 
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
 
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
 
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())
 
  if c ==# "b"
      let c = "("
  elseif c ==# "B"
      let c = "{"
  elseif c ==# "d"
      let c = "["
  endif
 
  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

function! HLNext (blinktime)
    highlight WhiteOnRed ctermfg=white ctermbg=red
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('WhiteOnRed', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    call matchdelete(ring)
    redraw
endfunction

augroup spell_check
  au!
  au BufRead,BufNewFile *.md setlocal spell
  au FileType gitcommit setlocal spell
augroup END

augroup autoload_vimrc
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

augroup highlight_nbsp
  au!
  au BufEnter * highlight NonBreakingSpace guibg=red
  au BufEnter * :match NonBreakingSpace /\%xa0/
augroup END

augroup file_type
  au!
  au BufRead,BufNewFile *.es6 setfiletype javascript
augroup END
