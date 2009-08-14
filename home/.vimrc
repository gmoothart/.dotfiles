"
" VIM Configuration
"
" TODO:
" 1) turbo-nav. Can I use alt- or ctrl- plus hjkl to do 5 motions, like Shai?
" 2) hex-mode in Vim: http://vim.wikia.com/wiki/Improved_Hex_editing
" 3) Show whitespace?
" 4) Add keybindings to make it easier to edit .vim files?
"    http://www.oreillynet.com/onlamp/blog/2006/08/make_your_vimrc_trivial_to_upd_1.html
" 5) no line wrapping? 
"
"

set nocompatible

set runtimepath+=~/.vim  "Use instead of "vimfiles" on windows

"
" Grab all customized scripts in a cross-platform way.
" can use has("unix"), has("win32"), etc. for more complicated scenarios
"
runtime! myscripts/*

"
" Platform-specific stuffz
"

"To avoid issues, use unix line-endings by default
set fileformats=unix,dos,mac


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
colors slate
set guifont=Consolas:h12,Monaco:h15
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
winpos 50 50
set lines=50
set columns=100

"
" Function key remappings
" These work in both normal and insert mode
"
nnoremap <F3> :vimgrep 
inoremap <F3> <esc>:vimgrep 

nnoremap <F4> :bd<CR>
inoremap <F4> <esc>:bd<CR>

nnoremap <F5> :NERDTreeToggle<CR>
inoremap <F5> <esc>:NERDTreeToggle<CR>


nnoremap <F6> :bp<CR>
inoremap <F6> <esc>:bp<CR>

nnoremap <F7> :bn<CR>
inoremap <F7> <esc>:bn<CR>

nnoremap <F8> :cp<CR>
inoremap <F8> <esc>:cp<CR>

nnoremap <F9> :cn<CR>
inoremap <F9> <esc>:cn<CR>

nnoremap <F12> :A<CR> 
inoremap <F12> <esc>:A<CR> 

"
" Leader remappings>
"
let mapleader = ","
" Make vimrc easier to edit
noremap <Leader>vv :edit ~/.vimrc<CR>
noremap <Leader>vs :source ~/.vimrc<CR>:exe ":echo 'vimrc reloaded'"<CR>
"configure the Alternate plugin
let g:alternateNoDefaultAlternate = 1
noremap <Leader>as :AS<CR>
noremap <Leader>av :AV<CR>

noremap <Leader>r :!rake 

noremap <Leader>co :VSScheckout
noremap <Leader>ci :VSScheckin

" Configure FuzzyFinder
"let g:FuzzyFinderOptions.Base.key_open_split = '<C-k>'
"let g:FuzzyFinderOptions.Base.key_open_vsplit = '<C-l>'
"let g:FuzzyFinderOptions.Base.key_open_tab = '<C-t>'
"let g:FuzzyFinderOptions.File.excluded_path = 'bin\~$|obj\~$|\.exe$|\.dll$|\.scc$|\.jpg$|\.gif$|\.png$'
"let g:FuzzyFinderOptions.File.excluded_path    = '\v\.o$|\.exe$|\.bak$|\.swp$|\.dll$'


nnoremap <Leader>e :FuzzyFinderFile<CR>
nnoremap <Leader>b :FuzzyFinderBuffer<CR>

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
set dir=$temp       " Make swap live in the %TEMP% directory
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
noremap ' `
noremap ` '


nnoremap <space> <C-f>
nnoremap <S-space> <C-b>

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
" Shortcut for generating ctags
"
command! Gentags :! ctags -R --exclude=_vendor .

"allow local .vimrc files
set secure
set exrc

