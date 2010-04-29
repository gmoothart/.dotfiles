
" windows syntax. unix will be different
nnoremap <F1> :% !xmllint.exe "%" --format<CR>
inoremap <F1> <esc>:% !xmllint.exe "%" --format<CR>

