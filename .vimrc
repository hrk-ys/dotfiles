if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
set enc=utf8

filetype off


if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'


NeoBundle 'jpalardy/vim-slime'

" シンタックスチェック
NeoBundle 'scrooloose/syntastic'
" j / k の移動高速化
NeoBundle 'rhysd/accelerated-jk'

" ファイルオープン
NeoBundle 'kien/ctrlp.vim'

" リファレンス参照
NeoBundle 'thinca/vim-ref'

" 補完
NeoBundle 'Shougo/neocomplete.vim'

" git diff
NeoBundle 'airblade/vim-gitgutter'

" perl シンタックス
NeoBundle "vim-perl/vim-perl"

" オムニ補完
NeoBundle "c9s/perlomni.vim"
""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

" Coffee Script
NeoBundle 'kchmck/vim-coffee-script'


filetype plugin indent on     " required!
filetype indent on
syntax on
NeoBundleCheck

let g:accelerated_jk_acceleration_table = [10,5,3]
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


"" neocomplete.vim {{{
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }
 
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
 
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
 
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
""\<Space>"
 
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
 
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
 
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
 
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif
	 
" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
	 
"}}}


" gitgutter plugin
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>



set tabstop=4
set expandtab
set shiftwidth=4
set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set incsearch

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
map ,pe <Esc>:! perl -Ilib %<CR>
map ,pc <Esc>:! perl -Ilib -It/lib -c %<CR>
map ,pd <Esc>:! perl -d -Ilib %<CR>
map ,pp <Esc>:! prove -lvc -Ilib -It/lib %<CR>

syntax on
augroup filetypedetect
	au BufNewFile,BufRead *.psgi    setf perl
	au BufNewFile,BufRead *.t       setf perl
	au BufNewFile,BufRead *.tt      setf tt2html
	au BufNewFile,BufRead *.tt2     setf tt2html
	au BufNewFile,BufRead cpanfile  setf perl
	au BufNewFile,BufRead *.coffee  setf coffee
augroup END

" furuta add
filetype on
"autocmd FileType html :set  encoding=sjis
"autocmd FileType perl :set  encoding=euc-jp
"utocmd FileType t    :set  encoding=euc-jp
"utocmd FileType sql  :set  encoding=sjis
"utocmd FileType sql  :set  termencoding=euc-jp

autocmd! FileType tt2html      setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd! FileType html         setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd! FileType javascript   setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd! FileType coffee       setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

syntax enable
set number
set laststatus=2
set showcmd
" set listchars=eol:$,tab:>-
" set list

autocmd FileType * set formatoptions-=ro

" cursor highlight
highlight CursorColumn ctermbg=Black
augroup cch
    autocmd! cch
    autocmd WinLeave * set nocursorcolumn nocursorline
    autocmd WinEnter,BufRead * set cursorcolumn cursorline
augroup END

map!  
