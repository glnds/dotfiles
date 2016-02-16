"        _
"  _  __(_)_ _  ________
" | |/ / /  ' \/ __/ __/
" |___/_/_/_/_/_/  \__/
"
" Colors {{{
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark    " Setting dark mode
syntax on
highlight ColorColumn ctermbg=237
"}}}
" Options {{{
filetype plugin indent on

set timeout timeoutlen=500 ttimeoutlen=100

set hidden                " hide buffers instead of closing them
set mouse=                " Disabling mouse support
set undolevels=1000       " Do ALL THE undo's!
set undoreload=10000      " Maximum number lines to save for undo on a buffer reload
set virtualedit=onemore   " Allow for cursor beyond last character
set tabstop=2             " Number of spaces for a tab
set softtabstop=2         " Number of spaces for a tab while editing
set shiftwidth=2          " Shift width value
set shiftround            " Round the shift indent
set expandtab             " Conver tabs to spaces
set lazyredraw            " Terminal performance optimisation
set magic                 " Better searching
set noswapfile            " Don't pollute my hard drive, even temporary
set wrap                  " Wrap long lines
set smartindent           " Auto indent when starting a new line
set relativenumber        " Use relative line numbers
set showmatch             " Show matching brackets (Damn this is so cool!)
set ignorecase            " Case insensitive search
set smartcase             " Case sensitive when uc present
set cursorline            " Highlight cursorline!
set ruler                 " Always show current position
set list                  " Show specials charcters like tabs (^I), end of line ($), ...
set splitbelow            " Split current window below
set splitright            " Split current window right
set showcmd               " Display incomplete commands
set autowrite             " Automatically :write before running commands
set colorcolumn=101        " Make it obvious where 80 characters is
set number                " Show line numbers
set numberwidth=5         " Line number reserved space
set autochdir             " Change the current dir if you open a file
set modelines=1           " Disable modeline support
set guioptions=TlrLR      " Options when running vim in GUI mode
set cpoptions+=$          " Show a $ sign in the change buffer
"set t_Co=256              " Number of colors

set spellfile=$HOME/.vim-spell-en.utf-8.add "Word list file

if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
"  set t_ut=
endif

" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Plugins {{{
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'

Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'chase/vim-ansible-yaml'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'Valloric/YouCompleteMe'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'dag/vim-fish'
Plug 'rking/ag.vim'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'krisajenkins/vim-pipe'
Plug 'vim-scripts/SQLComplete.vim'
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
" Plug 'scrooloose/syntastic'

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
  "
" colorscheme has to be set after plugins are loaded!
colorscheme molokai
highlight LineNr guifg=#b3b3b3
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
" vim-go {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
" }}}
" Leader shortcuts {{{

" Check a key binding, ex: verbose nmap <Leader>r

let mapleader = ","
let maplocalleader = ","

nnoremap <Leader><Leader> V|                      " Select viual line
nnoremap <Leader>a :bprev<CR>|                    " Open the previous buffer
nnoremap <Leader>b :CtrlPBuffer<CR>|              " CTRLP find buffer mode
nnoremap <Leader>bm :CtrlPMixed<CR>|              " CTRLP find files, buffers and MRU files
nnoremap <Leader>bs :CtrlPMRU<CR>|                " CTRLP find MRU files
vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
nnoremap <Leader>cs :colorscheme solarized<CR>|   " Switch color scheme
nnoremap <Leader>cb :colorscheme badwolf<CR>|     " Switch color scheme
nnoremap <Leader>d :bd<CR>|                       " delete the current buffer
nnoremap <Leader>ev :vsp $MYVIMRC<cr>|            " Open up .vimrc quickly in a new buffer
nnoremap <Leader>gg :Goyo<CR>|                    " Switch to Goyo
nnoremap <Leader>m :VimuxRunCommand<CR>|          " Start vimux
nnoremap <Leader>p :CtrlP<CR>|                    " CTRLP find files
nnoremap <Leader>pp :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <Leader>pp <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nnoremap <Leader>s :bnext<CR>|                    " Open the next buffer
" nnoremap <Leader>sv :source $MYVIMRC<cr>|         " Source .vimrc explicitly
nnoremap <Leader>tt :TagbarToggle<CR>|            " Toggle Tagbar
nnoremap <Leader>vp :VimuxPromptCommand<CR>|      " Prompt for a command to run
nnoremap <Leader>vl :VimuxRunLastCommand<CR>      " Run last command executed by VimuxRunCommand
nnoremap <Leader>vi :VimuxInspectRunner<CR>|      " Inspect runner pane
nnoremap <Leader>vq :VimuxCloseRunner<CR>|        " Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vx :VimuxInterruptRunner<CR>|    " Interrupt any command running in the runner pane
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>|  " Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <Leader>w :w<CR>|                        " Save buffer
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>| " Remove trailing whitespaces

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

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
" Silver Searcher {{{
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  "
  " Use ag in CtrlP for listing files. Lightning fast and respects gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" }}}

" vim:foldmethod=marker:foldlevel=0
