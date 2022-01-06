"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

lua require('init')

filetype plugin indent on

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
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gd <cmd>lua require('telescope.builtin').git_commits()<cr>

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
let g:vimsyn_embed = 'l'
match ErrorMsg '\s\+$'
highlight ErrorMsg guibg=White guifg=Red
highlight LineNr guifg=#b3b3b3
"}}}
" FileType setup {{{
augroup filetypes
  " autocmd!
  " " yaml
  " autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2 foldmethod=indent foldlevel=20
  " " Markdown
  " autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
  " autocmd FileType markdown setlocal wrap textwidth=100
  " " Rust
  " autocmd BufRead,BufNewFile *.rs setlocal filetype=rust
  " " Javascript
  " autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
  " " Julia
  " autocmd BufRead,BufNewFile *.jl setlocal filetype=julia
  " " C/C++
  " autocmd FileType c setlocal shiftwidth=2 tabstop=2
  " autocmd FileType cpp setlocal shiftwidth=2 tabstop=2
  " autocmd FileType cc setlocal shiftwidth=2 tabstop=2
  " autocmd FileType hpp setlocal shiftwidth=2 tabstop=2
  " autocmd FileType h setlocal shiftwidth=2 tabstop=2
  " autocmd FileType go setlocal foldmethod=indent foldlevel=20 foldnestmax=1



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
