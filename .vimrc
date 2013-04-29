if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
set enc=utf8

set tabstop=4
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

map ,ptv <Esc>:'<,'>! perltidy<CR>
map ,pt <Esc>:%! perltidy<CR>
map ,tl <Esc>:Tlist<CR>
map ,pe <Esc>:! perl -Ipm %<CR>
map ,pc <Esc>:! perl -Ipm -c %<CR>
map ,pd <Esc>:! perl -d -Ipm %<CR>
map ,pp <Esc>:! prove -lvc -Ipm  %<CR>

syntax on
au BufNewFile,BufRead *.mt setf tt2html
au BufNewFile,BufRead *.t  set filetype=perl 
au BufNewFile,BufRead *.psgi  set filetype=perl 

" furuta add
filetype on
"autocmd FileType html :set  encoding=sjis
"autocmd FileType perl :set  encoding=euc-jp
"utocmd FileType t    :set  encoding=euc-jp
"utocmd FileType sql  :set  encoding=sjis
"utocmd FileType sql  :set  termencoding=euc-jp

syntax enable
set number
set laststatus=2
set showcmd
" set listchars=eol:$,tab:>-
" set list


map!  
