"
" Check-in/Check-out from vss
" Inspired by:  http://kevin-berridge.blogspot.com/2008/10/vim-tfs-integration.html
"

function! VSScheckout()
  exe '!setlocal SSDIR="' g:SSDIR '" && "C:\\Program Files\\Microsoft Visual SourceSafe\\ss.exe" Checkout "' expand('%:p') '"'
endfunction
command! VSScheckout :call VSScheckout()

function! VSScheckin()
  exe '!setlocal SSDIR="' g:SSDIR '" && "C:\\Program Files\\Microsoft Visual SourceSafe\\ss.exe" Checkin "' expand('%:p') '"'
endfunction
command! VSScheckin :call VSScheckin()

