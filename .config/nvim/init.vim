"    _      _ __        _
"   (_)__  (_) /_ _  __(_)_ _
"  / / _ \/ / __/| |/ / /  ' \
" /_/_//_/_/\__(_)___/_/_/_/_/

lua require('init')

" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').git_files()<cr>
" nnoremap <leader>fr <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fs <cmd>lua require('telescope.builtin').grep_string()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <leader>fd <cmd>lua require('telescope.builtin').file_browser()<cr>
" nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
" nnoremap <leader>gd <cmd>lua require('telescope.builtin').git_commits()<cr>

nnoremap <Leader><Leader> V|                      " Select viual line
nnoremap <Leader>a :bprev<CR>|                    " Open the previous buffer
nnoremap <Leader>s :bnext<CR>|                    " Open the next buffer
nnoremap <Leader>w :w<CR>|                        " Save buffer

vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
inoremap <Leader>v <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>



nmap <S-Enter> Ojj
nmap <CR> ojj
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

set background=dark
colorscheme badwolf
let g:badwolf_darkgutter = 1
let g:vimsyn_embed = 'l'
match ErrorMsg '\s\+$'
highlight ErrorMsg guibg=White guifg=Red
highlight LineNr guifg=#b3b3b3
