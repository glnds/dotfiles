"        _              
"  _  __(_)_ _  ________
" | |/ / /  ' \/ __/ __/
" |___/_/_/_/_/_/  \__/ 
"
let mapleader = " "

colorscheme badwolf
let g:badwolf_darkgutter = 1 " Make the gutters darker than the background.
let g:badwolf_tabline = 0    " Make the tab line darker than the background

syntax on

set laststatus=2          " Always display the statusline in all windows 
set backspace=2           " Backspace deletes like most programs in insert mode 
set nobackup              " Don't make a backup file
set nowritebackup         " Dont't make a backup file
set encoding=utf8         " Sets charachter encoding
set mouse=                " Disabling mouse support
set history=1000          " Remember ALL THE commands!
set undolevels=1000       " Do ALL THE undo's!
set undoreload=10000      " Maximum number lines to save for undo on a buffer reload
set virtualedit=onemore   " Allow for cursor beyond last character
set tabstop=2             " Number of spaces for a tab
set softtabstop=2         " Number of spaces for a tab while editing
set shiftwidth=2          " Shift width value
set shiftround            " Round the shift indent
set expandtab             " Insert spaces when tab key is pressed
set autoread              " Autoread a file when it's changed from outside
set lazyredraw            " Terminal performance optimisation
set magic                 " Better searching
set noswapfile            " Don't pollute my hard drive, even temporary
set autoindent            " Copy indent form current line when starting a new line
set smartindent           " Auto indent when starting a new line
set relativenumber        " Use relative line numbers
set showmatch             " Show matching brackets (Damn this is so cool!)
set incsearch             " Pattern highlighting while searching
set hlsearch              " Hightlight search matchese
set ignorecase            " Case insensitive search
set smartcase             " Case sensitive when uc present
set cursorline            " Highlight cursorline!
set ruler                 " Always show current position
set list                  " Show specials charcters like tabs (^I), end of line ($), ...
set cpoptions+=$          " Show a dollar sign in the change buffer
set splitbelow            " Split current window below
set splitright            " Split current window right
set showcmd               " Display incomplete commands
set autowrite             " Automatically :write before running commands
set colorcolumn=81        " Make it obvious where 80 characters is
set number                " Show line numbers
set numberwidth=5         " Line number reserved space
set autochdir             " Change the current dir if you open a file

" https://neovim.io/doc/user/nvim_from_vim.html
if !has('nvim')
  set cryptmethod=blowfish2 " Use strong blowfish algorithm when encrypting files
  set nocompatible          " Don't care about Vi-compatibility
  set ttyfast               " Terminal performance optimisation
endif

set wildmenu                                     " Enable command-line completion
set wildmode=list:longest,full                   " Wildmenu completion mode
set wildignore+=.git,.svn                        " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.zip                            " zip

"set list listchars=tab:»·,trail:·,nbsp:· "Display extra whitespace
set listchars-=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail


call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'sjl/badwolf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'mileszs/ack.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'chase/vim-ansible-yaml'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'tomtom/tcomment_vim'
Plug 'kien/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'dag/vim-fish'

call plug#end()

" Interesting plugins: 
  "- Plug 'benmills/vimux'
  "- Plug 'christoomey/vim-tmux-navigator'
  "- Plug 'noahfrederick/vim-hemisu'
  "- Plug 'editorconfig/editorconfig-vim'
  "- Plug 'tpope/vim-unimpaired'
  "- Plug 'junegunn/goyo.vim'
  "- Plug 'scrooloose/syntastic'
  "- Plug 'Valloric/YouCompleteMe'

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

let g:airline_powerline_fonts = 1    "Enable powerline font for vim-airline
let g:netrw_liststyle=3

highlight ColorColumn ctermbg=237

" NERDTree config
let NERDTreeChDirMode=2     " Display the current working directory
let NERDTreeShowBookmarks=1 " Show Bookmarks on startup
"let NERDTreeShowHidden=1   " Show hidden files on startup
nnoremap <leader>n :NERDTree .<CR>
map <F2> :NERDTreeToggle<CR>

" Tagbar config
nmap <F8> :TagbarToggle<CR>

" Ctrl P config
let g:ctrlp_map = ',t'
nnoremap <silent> ,t :CtrlP<cr>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_custom_ignore = {'dir': 'dist'}

" Python mode config
let g:pymode_rope = 0 "Replaced by jedi-vim
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0

" Personal key mappings
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nmap <Leader><Leader> V
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
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
" Disabling arrow keys in normal and insert mode
nnoremap  <up> <nop>
nnoremap  <down> <nop>
nnoremap  <left> <nop>
nnoremap  <right> <nop>
inoremap  <up> <nop>
inoremap  <down> <nop>
inoremap  <left> <nop>
inoremap  <right> <nop>
" Disable arrow keys in command mode
cnoremap <Up> <nop>
cnoremap <Down> <nop>
" Disabling escape key. It's too far away!
inoremap  <esc> <nop>
" `jj` is much better :)
inoremap  jj <esc>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  "
  " Use ag in CtrlP for listing files. Lightning fast and respects      .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
