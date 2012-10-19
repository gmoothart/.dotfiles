"
" VIM Configuration
"

set nocompatible

"Use :Helptags to install help for all plugins
set runtimepath^=~/.vim  "Use instead of "vimfiles" on windows
runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()

"
" Platform/environment issues
"
if has("gui_running")
"  set lines=50
"  set columns=100
endif

colors jellybeans

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

"settings specific for terminals.
if $TERM==#"xterm" || $TERM==#"linux" || $TERM==#"cygwin"
  " Mouse support in xterm does not work beyond 95 or so columns, very confusing
  " http://stackoverflow.com/questions/7000960/vim-mouse-problem
  set mouse=""

  "workaround for putty-specific encoding problems.
  "For more help with this:
  "http://vim.wikia.com/wiki/Mapping_fast_keycodes_in_terminal_Vim
  if $TERM==#"xterm"
    set <F2>=[12~
    set <F3>=[13~
    set <F4>=[14~
    set <F5>=[15~
    set <F6>=[17~
    set <F7>=[18~
    set <F8>=[19~
    set <F9>=[20~
    set <F10>=[21~
    set <F11>=[23~
    set <F12>=[24~

    set <S-Down>=[B
    set <S-Up>=[A
    set <S-Left>=[D
    set <S-Right>=[C

    "Mapping <C-Tab> (and, I think, <S-space> would require patching Putty: "http://stackoverflow.com/a/789593/13356

    set t_Co=256
  else "other non-putty terminals
    "slate is better for low-color terminals.
    colors slate
  endif

endif


"To avoid issues, use unix line-endings by default
set fileformats=unix,dos,mac

" Make swap live in the temp directory
if has('win32')
  set dir=$temp
  set guifont=Consolas:h11
elseif has('unix')
  set dir=/tmp
  set backupdir=/tmp
  set guifont=Inconsolata\ 13
elseif has('mac')
  set guifont=Monaco:h15
endif

set noswapfile

"
" Buffer switching
"
set hidden
set autowriteall


"
" Searching options
"
set hlsearch
set incsearch
set ignorecase smartcase

"
" colors/font/tab settings, etc.
"
syntax on

"
" Formatting
"
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set smartindent
set foldmethod=syntax
set nofoldenable
set nowrap

set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey guibg=darkgrey


"set number
filetype plugin on
filetype indent on

" fix slowness on long lines
"set synmaxcol=150

" Always show powerline status bar
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colemak remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colemak direction keys
" j - left
" l - right
" h - up
" k - down
"
noremap h gk
noremap j h
noremap k gj

" Colemak ':' is slightly harder to hit than qwerty ':'. Make it easier by
" swapping ':' and ';'
noremap : ;
noremap ; :

" window split mappings
noremap <C-w>h <C-w>k
noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j

"map <C-w>h <C-k>
"map <C-w>j <C-h>
"map <C-w>k <C-j>
"map <C-w>l <C-l>


"
" Function key remappings
" These work in both normal and insert mode
"
"nnoremap <F2> :NERDTreeToggle<CR>
"inoremap <F2> <esc>:NERDTreeToggle<CR>

nnoremap <F3> :TlistToggle<CR>
inoremap <F3> <esc>:TlistToggle<CR>

" use bclose plugin to close a buffer but not its window
nnoremap <F4> :Kwbd<CR>
inoremap <F4> <esc>:Kwbd<CR>

"iterate over open buffers
nnoremap <F5> :bp<CR>
inoremap <F5> <esc>:bp<CR>

nnoremap <F6> :bn<CR>
inoremap <F6> <esc>:bn<CR>


nnoremap <F7> :cp<CR>
inoremap <F7> <esc>:cp<CR>

nnoremap <F8> :cn<CR>
inoremap <F8> <esc>:cn<CR>

"jump to tag, showing matches if there are more than one
noremap <F12> <C-]>

" format xml.
" windows syntax. unix will be different
nnoremap <C-F1> :% !xmllint.exe "%" --format<CR>
inoremap <C-F1> <esc>:% !xmllint.exe "%" --format<CR>

"
" Leader remappings>
"
let mapleader = ","
" Make vimrc easier to edit
noremap <Leader>vv :edit ~/.vimrc<CR>
noremap <Leader>vs :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>

"configure the Alternate plugin
let g:alternateNoDefaultAlternate = 1

noremap <Leader>r :!rake 

" Configure FuzzyFinder
"let g:FuzzyFinderOptions.Base.key_open_split = '<C-k>'
"let g:FuzzyFinderOptions.Base.key_open_vsplit = '<C-l>'
"let g:FuzzyFinderOptions.Base.key_open_tab = '<C-t>'
"let g:FuzzyFinderOptions.File.excluded_path = 'bin\~$|obj\~$|\.exe$|\.dll$|\.scc$|\.jpg$|\.gif$|\.png$'
"let g:FuzzyFinderOptions.File.excluded_path    = '\v\.o$|\.exe$|\.bak$|\.swp$|\.dll$'

noremap <silent><Leader>e :FufCoverageFile<CR>
nnoremap <Leader>b :FufBuffer<CR>


" need to set up snippent mappings manually for some reason
source ~/.vim/bundle/snipmate.vim/after/plugin/snipMate.vim

command! Edsnip :execute ":split " . snippets_dir . &ft . ".snippets"


"
"Misc
"
set virtualedit=block
set backspace=indent,eol,start
set nobackup
set guioptions-=T
set guioptions+=b
set showmatch
set ruler
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>
noremap ' `
noremap ` '


"shortcuts for open/close tabs
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

nnoremap <space> <C-f>
nnoremap <S-space> <C-b>

" toggle between current and prev buffer
noremap <C-Tab> <C-^>

"Map <C-L> (redraw screen) to also turn off search highlighting until the
"next search
nnoremap <C-L> :nohlsearch<CR><C-L>

"
" Editing Commands
"

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
noremap Y y$

" Add blank space above/below with <CR>, <S-CR> 
nnoremap <CR> o<Esc>
nnoremap <S-CR> O<Esc>

" use tab to indent, in normal and visual mode.
" xnoremap does not apply them to Select mode, which is desirable for interop
" with snipMate
nnoremap <Tab> >>
xnoremap <Tab> >
nnoremap <S-Tab> <<
xnoremap <S-Tab> <

"
" Fall back to keyword-completion if there is no omni-completion. 
" Bind to C-Space. Courtesy of sontek:
" http://blog.sontek.net/2008/06/12/vim-tip-use-ctrl-space-for-omni-and-keyword-completion/
"
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"

"
" tags
"
"Shortcut for generating ctags
command! Gentags :! ctags -R --exclude=ckeditor --exclude=vendor --exclude=log

"allow local .vimrc files
set secure
set exrc
