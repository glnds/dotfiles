"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

" Options {{{
filetype plugin indent on
set timeout timeoutlen=500 ttimeoutlen=100
" Vim autocomplete options
set completeopt=longest,menuone
set hidden                " hide buffers instead of closing them
" set showtabline=2
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
set updatetime=250        " Update time for diff markers
set hlsearch
set incsearch
set wildignore+=*/.git/*,*/tmp/*,*.swp
"set t_Co=256              " Number of colors

set spellfile=$HOME/.vim-spell-en.utf-8.add "Word list file
match ErrorMsg '\s\+$'

" if &term =~ '256color'
"   " Disable Background Color Erase (BCE) so that color schemes
"   " work properly when Vim is used inside tmux and GNU screen.
"   " See also http://snk.tuxfamily.org/log/vim-256color-bce.html
" "  set t_ut=
" endif


" }}}
" Backup {{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}
" Plugins {{{
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-vinegar'
Plug 'itchyny/lightline.vim'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'elzr/vim-json'
" Plug 'airblade/vim-gitgutter'
" Plug 'hashivim/vim-terraform'
" Plug 'pearofducks/ansible-vim'
" Plug 'rust-lang/rust.vim'

" Plug 'bling/vim-bufferline'
Plug 'ap/vim-buftabline'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'aws-cloudformation/cfn-python-lint'
" Color schemes
" Plug 'chriskempson/base16-vim'
Plug 'tomasr/molokai'
" Plug 'tpope/vim-dispatch'

"Plug 'sjl/badwolf'
"Plug 'morhetz/gruvbox'
"Plug 'altercation/vim-colors-solarized'
"Plug 'dracula/vim'
"Plug 'vim-scripts/wombat256.vim'
call plug#end()
" }}}
" netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" }}}
" coc.nvim {{{

" Docs for Python & Rust config: https://github.com/neoclide/coc.nvim/wiki/Language-servers
" Yaml: https://github.com/neoclide/coc-yaml
" CloudFormation: https://github.com/joenye/coc-cfn-lint
" JSON: https://github.com/neoclide/coc-json

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-next)
nmap <silent> ]c <Plug>(coc-diagnostic-prev)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" }}}
" Leader shortcuts {{{

" Check a key binding, ex: verbose nmap <Leader>r

let mapleader = ","
let maplocalleader = ","

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
" ripgrep {{{
if executable('rg')
" Use ripgrep: https://github.com/BurntSushi/ripgrep
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
" }}}
" vim-go {{{
if executable('rg')
  " let g:go_def_mode='gopls'
  " let g:go_info_mode='gopls'
  let g:go_metalinter_autosave = 1
  let g:go_metalinter_command = "golangci-lint"
  let g:go_fmt_autosave = 1
  let g:go_fmt_command = "gofmt"
  let g:go_fmt_options = "-s"
endif
" }}}
" rust {{{
let g:rustfmt_autosave = 1
" }}}
" Colors {{{
set termguicolors
" endif
syntax on
let base16colorspace=256
let g:rehash256 = 1
let g:solarized_termcolors=256
colorscheme molokai

highlight ErrorMsg guibg=White guifg=Red
highlight LineNr guifg=#b3b3b3
"}}}
" FileType setup {{{
augroup filetypes
  autocmd!
  " YAML
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=indent foldlevel=20
  " Markdown
  autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
  autocmd FileType markdown setlocal wrap textwidth=100
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
  autocmd FileType go setlocal foldmethod=syntax foldlevel=0 foldnestmax=1
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

" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
" augroup remember_folds
"   autocmd!
"   au BufWinLeave ?* mkview 1
"   au BufWinEnter ?* silent! loadview 1
" augroup END

au BufEnter * call MyLastWindow()
function! MyLastWindow()
  " if the window is quickfix go on
  if &buftype=="quickfix"
    " if this window is last on screen quit without warning
    if winbufnr(2) == -1
      quit!
    endif
  endif
endfunction

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" vim:foldmethod=marker:foldlevel=0
