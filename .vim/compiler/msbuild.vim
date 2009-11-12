" Vim compiler file
" Compiler: msbuild

if exists("current_compiler")
  finish
endif
let current_compiler = "msbuild"

if exists(":CompilerSet") != 2 " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" default errorformat
CompilerSet  errorformat=\ %#%f(%l\\\,%c):\ %m
"set         errorformat=%f(%l\\,%c):\ error\ CS%n:\ %m


" default make
CompilerSet makeprg=msbuild\ /nologo\ /verbosity:quiet\ /ignore:.wdproj

