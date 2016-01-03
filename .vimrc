"        _              
"  _  __(_)_ _  ________
" | |/ / /  ' \/ __/ __/
" |___/_/_/_/_/_/  \__/ 
"                       
" Colors {{{
" Must be on top
set nocompatible          " Don't care about Vi-compatibility

syntax on
set background=dark
colorscheme badwolf
"colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_degrade=1
let g:solarized_bold=0
let g:solarized_underline=0
let g:solarized_italic=0
let g:solarized_contrast='high'
let g:solarized_visibility='high'
let g:badwolf_darkgutter = 1 " Make the gutters darker than the background.
let g:badwolf_tabline = 0    " Make the tab line darker than the background
highlight ColorColumn ctermbg=237
"}}}
" Options {{{
filetype plugin indent on

" autocmd BufNewFile,BufReadPost *.json setlocal filetype=json

set timeout timeoutlen=500 ttimeoutlen=100

set hidden                " hide buffers instead of closing them
set laststatus=2          " Always display the statusline in all windows 
set backspace=2           " Backspace deletes like most programs in insert mode 
set encoding=utf8         " Sets charachter encoding
set mouse=                " Disabling mouse support
set history=1000          " Remember ALL THE commands!
set undolevels=1000       " Do ALL THE undo's!
set undoreload=10000      " Maximum number lines to save for undo on a buffer reload
set virtualedit=onemore   " Allow for cursor beyond last character
set tabstop=2             " Number of spaces for a tab
set softtabstop=2         " Number of spaces for a tab while editing
set shiftwidth=2          " Shift width value
set smarttab              " Insers blanks according to shiftwidth
set shiftround            " Round the shift indent
set expandtab             " Conver tabs to spaces
set autoread              " Autoread a file when it's changed from outside
set lazyredraw            " Terminal performance optimisation
set magic                 " Better searching
set noswapfile            " Don't pollute my hard drive, even temporary
set autoindent            " Copy indent form current line when starting a new line
set wrap                  " Wrap long lines
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
set splitbelow            " Split current window below
set splitright            " Split current window right
set showcmd               " Display incomplete commands
set autowrite             " Automatically :write before running commands
set colorcolumn=81        " Make it obvious where 80 characters is
set number                " Show line numbers
set numberwidth=5         " Line number reserved space
set autochdir             " Change the current dir if you open a file
set modelines=1           " Disable modeline support
set guioptions=TlrLR      " Options when running vim in GUI mode
set cpoptions+=$          " Show a $ sign in the change buffer
set t_Co=256              " Number of colors
set complete+=kspell      " Autocomplete with dictionary words when spell check is on

set spellfile=$HOME/.vim-spell-en.utf-8.add "Word list file
set listchars=tab:»·,trail:·,nbsp:· "Display extra whitespace

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" https://neovim.io/doc/user/nvim_from_vim.html
if !has('nvim')
  set cryptmethod=blowfish2 " Use strong blowfish algorithm when encrypting files
  set ttyfast               " Terminal performance optimisation
endif
" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Wildmenu {{{
set wildmenu                                     " Enable command-line completion
set wildmode=list:longest,full                   " Wildmenu completion mode
set wildignore+=.git,.svn                        " Version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.zip                            " zip
" }}}
" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'vim-ruby/vim-ruby'
Plug 'chase/vim-ansible-yaml'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'dag/vim-fish'
Plug 'rking/ag.vim'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'markcornick/vim-terraform'
Plug 'krisajenkins/vim-pipe'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'

call plug#end()

" Interesting plugins: 
  "- Plug 'noahfrederick/vim-hemisu'
  "- Plug 'editorconfig/editorconfig-vim'
  "- Plug 'tpope/vim-unimpaired'
  "- Plug 'rizzatti/dash.vim'
  "- Plug 'easymotion/vim-easymotion'
  "- Plug 'klen/python-mode'
  "- Plug 'davidhalter/jedi-vim'
  "- Plug 'Yggdroot/indentLine'
  "- Plug 'rizzatti/dash.vim'
" }}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}"
" Airline {{{
let g:airline_powerline_fonts = 1    "Enable powerline font for vim-airline
let g:netrw_liststyle=3
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}
" NERDTree {{{
let NERDTreeChDirMode=2     " Display the current working directory
let NERDTreeShowBookmarks=1 " Show Bookmarks on startup
"let NERDTreeShowHidden=1   " Show hidden files on startup
" }}}
" CtrlP {{{
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_open_new_file = 'v'
"let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {'dir': 'dist'}
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \}
" Use the nearest .git directory as the cwd
let g:ctrlp_working_path_mode = 'r'
" }}}
" Leader shortcuts {{{

" Check a key binding, ex: verbose nmap <Leader>r

let mapleader = ","
let maplocalleader = ","

nnoremap <Leader><Leader> V|                      " Select viual line
nnoremap <leader>a :Ag|                           " Silver Searcher
nnoremap <leader>b :CtrlPBuffer<cr>|              " CTRLP find buffer mode
nnoremap <leader>bm :CtrlPMixed<cr>|              " CTRLP find files, buffers and MRU files
nnoremap <leader>bs :CtrlPMRU<cr>|                " CTRLP find MRU files
nnoremap <Leader>c :.w !pbcopy<CR><CR>|           " Copy to clipboard
vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
nnoremap <Leader>cs :colorscheme solarized<CR>|   " Switch color scheme
nnoremap <Leader>cb :colorscheme badwolf<CR>|     " Switch color scheme
nnoremap <leader>ev :vsp $MYVIMRC<cr>|            " Open up .vimrc quickly in a new buffer
nnoremap <Leader>gg :Goyo<CR>|                    " Switch to Goyo
nnoremap <leader>m :VimuxRunCommand<CR>|          " Start vimux
nnoremap <leader>t :TagbarToggle<CR>              " Toggle Tagbar
nnoremap <Leader>vp :VimuxPromptCommand<CR>|      " Prompt for a command to run
nnoremap <Leader>vl :VimuxRunLastCommand<CR>      " Run last command executed by VimuxRunCommand
nnoremap <Leader>vi :VimuxInspectRunner<CR>|      " Inspect runner pane
nnoremap <Leader>vq :VimuxCloseRunner<CR>|        " Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vx :VimuxInterruptRunner<CR>|    " Interrupt any command running in the runner pane
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>|  " Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <leader>sv :source $MYVIMRC<cr>|         " Source .vimrc explitly
nnoremap <Leader>p :CtrlP<CR>|                    " CTRLP find files

nnoremap <Leader>pp :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <Leader>pp <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

nnoremap <Leader>w :w<CR>|                        " Save buffer
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>| " Remove trailing whitespaces
" }}}
" Shortcuts {{{
nmap <S-Enter> Ojj
nmap <CR> ojj
" NERDTree
map <F2> :NERDTreeToggle<CR>
" Tagbar config
"let g:tagbar_ctags_bin = '/usr/bin/ctags'"
" Ex-mode is shitty
nnoremap  Q <nop>
" Move single row on wrapped lines
nmap j gj
nmap k gk
" Folding
nnoremap <Space> za
vnoremap <Space> za
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
inoremap  jk <esc>
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" }}}
" Silerver Searcher {{{
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
" }}}

" vim:foldmethod=marker:foldlevel=0
