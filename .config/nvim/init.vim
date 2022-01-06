"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

lua require('init')

" Options {{{
filetype plugin indent on
set timeout timeoutlen=500 ttimeoutlen=100
" Vim autocomplete options
" set completeopt=longest,menuone
set completeopt=menu,menuone,noselect
" set showtabline=2
set inccommand=nosplit
set laststatus=2          " Always display the statusline in all windows
set backspace=2           " Backspace deletes like most programs in insert mode
set encoding=utf8         " Sets charachter encoding
set mouse=                " Disabling mouse support
set history=1000          " Remember ALL THE commands!
set undolevels=1000       " Do ALL THE undo's!
set undoreload=10000      " Maximum number lines to save for undo on a buffer reload
set virtualedit=onemore   " Allow for cursor beyond last character
set tabstop=4             " Number of spaces for a tab
set softtabstop=4         " Number of spaces for a tab while editing
set shiftwidth=4          " Shift width value
set t_BE=                 " fixes bracketed paste mode
set shiftround            " Round the shift indent
set expandtab             " Conver tabs to spaces
set signcolumn=yes
" set lazyredraw            " Terminal performance optimisation
" set magic                 " Better searching
" set noswapfile            " Don't pollute my hard drive, even temporary
" set nowrap                " Wrap long lines
set smartindent           " Auto indent when starting a new line
set relativenumber        " Use relative line numbers
set showmatch             " Show matching brackets (Damn this is so cool!)
set ignorecase            " Case insensitive search
set smartcase             " Case sensitive when uc present
set cursorline            " Highlight cursorline!
set ruler                 " Always show current position
set list                  " Show specials charcters like tabs (^I), end of line ($), ...
set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
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
set updatetime=300        " Update time for diff markers
set hlsearch
set incsearch
set wildignore+=*/.git/*,*/tmp/*,*.swp
set spellfile=$HOME/.vim-spell-en.utf-8.add "Word list file
" }}}
" Leader shortcuts {{{

" Check a key binding, ex: verbose nmap <Leader>r

" let mapleader = ","
" let maplocalleader = ","

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').file_browser()<cr>

nnoremap <Leader><Leader> V|                      " Select viual line
nnoremap <Leader>a :bprev<CR>|                    " Open the previous buffer
nnoremap <Leader>b :Buffers<CR>
vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
nnoremap <Leader>d :bd<CR>|                       " delete the current buffer
nnoremap <Leader>f :Files<CR>|                    " fzf search all files
nnoremap <Leader>g :GFiles<CR>|                   " fzf search for git tracked files
nnoremap <Leader>h :History<CR>|
nnoremap <Leader>m :VimuxRunCommand<CR>|          " Start vimux
nnoremap <Leader>v :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
inoremap <Leader>v <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nnoremap <leader>rs :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>| " Remove trailing whitespaces
nnoremap <Leader>s :bnext<CR>|                    " Open the next buffer
nnoremap <Leader>sv :source $MYVIMRC<cr>|         " Source .vimrc explicitly
nnoremap <Leader>w :w<CR>|                        " Save buffer

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" }}}
" Shortcuts {{{

"Disable the mouse wheel
inoremap <ScrollWheelUp> <Nop>
inoremap <ScrollWheelDown> <Nop>

nmap <S-Enter> Ojj
nmap <CR> ojj
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
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
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <buffer> rp :exec '!python' shellescape(@%, 1)<cr>

noremap pp :ALEFix<CR>
" }}}
" Colors {{{
set termguicolors
syntax on
set background=dark
colorscheme badwolf
let g:badwolf_darkgutter = 1
match ErrorMsg '\s\+$'
highlight ErrorMsg guibg=White guifg=Red
highlight LineNr guifg=#b3b3b3
"}}}
" FileType setup {{{
augroup filetypes
  autocmd!
  " yaml
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=indent foldlevel=20
  " Markdown
  autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
  autocmd FileType markdown setlocal wrap textwidth=100
  " Rust
  autocmd BufRead,BufNewFile *.rs setlocal filetype=rust
  " Javascript
  autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
  " Julia
  autocmd BufRead,BufNewFile *.jl setlocal filetype=julia
  " C/C++
  autocmd FileType c setlocal shiftwidth=2 tabstop=2
  autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType cc setlocal shiftwidth=2 tabstop=2
  autocmd FileType hpp setlocal shiftwidth=2 tabstop=2
  autocmd FileType h setlocal shiftwidth=2 tabstop=2
  autocmd FileType go setlocal foldmethod=indent foldlevel=20 foldnestmax=1
  " CloudFormation filetype config
  " autocmd BufRead,BufNewFile cfn-*.yaml,cfn-*.yml call SetCloudFormationOptions()
  " function SetCloudFormationOptions()
  "   setl nowrap
  "   set ft=cloudformation
  "   set syntax=yaml
  "   set tabstop=2
  "   set shiftwidth=2
  "   set softtabstop=2
  "   set foldmethod=indent
  "   set foldlevel=20
  "   set commentstring=#\ %s
  " endfunction
augroup end
" }}}


" vim:foldmethod=marker:foldlevel=0
