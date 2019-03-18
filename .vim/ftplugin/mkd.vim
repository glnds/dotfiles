setlocal autoindent
setlocal colorcolumn=0
setlocal linebreak
setlocal nonumber
setlocal shiftwidth=4
setlocal spell
setlocal tabstop=4
setlocal wrap
" display the rendered markdown in your browser
if executable('grip')
  nnoremap <buffer><space>m :Dispatch grip --pass $GRIP -b %<cr>
endif
