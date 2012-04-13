"
" VIM Configuration
"

set nocompatible

set runtimepath^=~/.vim  "Use instead of "vimfiles" on windows
runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()

"
" Platform/environment issues
"
if has("gui")
  set lines=50
  set columns=100
endif
set guifont=Consolas:h12,Monaco:h15,Inconsolata:h12

"To avoid issues, use unix line-endings by default
set fileformats=unix,dos,mac

colors jellybeans


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
"set number
filetype plugin on
filetype indent on

" fix slowness on long lines
set synmaxcol=200

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

noremap <C-w>h <C-w>k
noremap <C-w>j <C-w>h
noremap <C-w>k <C-w>j

" Colemak ':' is slightly harder to hit than qwerty ':'. Make it easier by
" swapping ':' and ';'
noremap : ;
noremap ; :



"
" Function key remappings
" These work in both normal and insert mode
"
nnoremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <esc>:NERDTreeToggle<CR>

" use bclose plugin to close a buffer but not its window
nnoremap <F4> <Plug>Kwbd
inoremap <F4> <esc><Plug>Kwbd

"iterate over open buffers
nnoremap <F5> :bp<CR>
inoremap <F5> <esc>:bp<CR>

nnoremap <F6> :bn<CR>
inoremap <F6> <esc>:bn<CR>


nnoremap <F7> :cp<CR>
inoremap <F7> <esc>:cp<CR>

nnoremap <F8> :cn<CR>
inoremap <F8> <esc>:cn<CR>

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

noremap <silent><Leader>e :FufFile<CR>
nnoremap <Leader>b :FufBuffer<CR>



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
" Make swap live in the %TEMP% directory
set dir=$temp
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
noremap ' `
noremap ` '


"shortcuts for open/close tabs
nnoremap <C-Insert> :tabnew<CR>
nnoremap <C-Delete> :tabclose<CR>

nnoremap <space> <C-f>
nnoremap <S-space> <C-b>

" toggle between current and prev buffer
noremap <C-Tab> <C-^>

"clear highlighted search terms with <esc> in normal mode
nnoremap <esc> :nohlsearch<return><esc>

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
nnoremap <Tab> >>
vnoremap <Tab> >
nnoremap <S-Tab> <<
vnoremap <S-Tab> <



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
"show matches when there is more than one
noremap <C-]> g<C-]>
"Shortcut for generating ctags
command! Gentags :! ctags -R --exclude=_vendor .

"allow local .vimrc files
set secure
set exrc
