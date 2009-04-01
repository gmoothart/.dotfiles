"
" Settings specific to .Net projects - build, etc.
"

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  
  "setup C# building
  autocmd BufNewFile,BufRead *.cs,*.aspx,.ascx,*.asax,*.config,*.master compiler msbuild
endif

