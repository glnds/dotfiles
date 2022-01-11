lua require('init')

nnoremap <Leader><Leader> V|                      " Select viual line

vnoremap <Leader>c :w !pbcopy<CR><CR>|            " Copy to clipboard
inoremap <Leader>v <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
