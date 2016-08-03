" VIM configuration file
" From https://gist.github.com/rocarvaj/2513367

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" disable vi compatibility (emulation of old bugs)
set nocompatible

" use indentation of previous line
set autoindent

" use intelligent indentation for C
set smartindent

" show current position
set ruler

" highlight all search pattern
set hlsearch

" enable incremental search
set incsearch

" configure tabwidth and insert space instead of tabs
set tabstop=4     " tab width is 4 spaces
set shiftwidth=4  " indent also with 4 spaces
set expandtab     " expand tabs to spaces

autocmd FileType make setlocal noexpandtab  " Do not expand tab to space for makefile

" wrap lines at 120 chars
set textwidth=120

" turn syntax highlighting on
set t_Co=256
syntax on

" turn line numbers on
set number

" highlight matching braces
set showmatch

" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Install OmniCppComplete like described on http://vim.wikia.com/wiki/C++_code_completion
" This offers intelligent C++ compeltion when typing '.' '->' or <C-o>
" Load standard tag files
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/gl
set tags+=~/.vim/tags/sdl
set tags+=~/.vim/tags/qt4

" enable OmniCppComplete
filetype plugin on
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1      " autocomplete after .
let OmniCpp_MayCompleteArrow = 1    " autocomplete after ->
let OmniCpp_MayCompleteScope = 1    " autocomplete after ::
let OmniCpp_DefaultNamesapces = ["std"]

"automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview


" Install DoxygenToolket from http://www.vim.org/scripts/script.php?script_id=987
let g:DoxygenToolkit_authorName="John Doe"

" Enhnaced keyboard mappings
"
" in normal mode F2 will save the file
map <F2> :w<CR>

" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i

" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$.h,:s,.X123X$,.cpp,<CR>

" recreate tags file with F5
map <F5> :!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>

" create doxygen comment
map <F6> :Dox<CR>

" build using makeprg with <F7>
map <F7> :make<CR>

" rebuild using makeprg with <S-F7>
map <S-F7> :make clean all<CR>

" goto definition with F12
map <F12> <C-J>

" in diff mode we use the spell check key for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !git diff<CR>:set syntax=diff buftype=nofile<CR>gg
else
  " spell settings
  :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  " set spellfile=~/.vim/spell/en.utf-8.spl
  map <M-Down> ]s
  map <M-Up> [s
endif

