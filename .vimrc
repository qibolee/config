autocmd BufRead *.cpp :call bdswitch#highlight()
autocmd BufRead *.h :call bdswitch#highlight()
autocmd filetype cpp :call bdswitch#highlight()
nnoremap ru :call bdswitch#update()<cr>
nnoremap rh :call bdswitch#highlight()<cr>
nnoremap rs :call bdswitch#searchconf()<cr>
nnoremap rc :cclose<cr>


syntax on

set autoread
set nu

" Basic settings{
set nocompatible
set novisualbell
"set paste

" ctags
set tags+=~/tags
set tags+=tags
set tags+=../tags
set tags+=../../tags
set tags+=../../../tags
set tags+=../../../../tags
set tags+=../../../../../tags
set tags+=../../../../../../tags
set tags+=../../../../../../../tags


" share clipboard with windows?
set clipboard+=unnamed 
set cursorline
set cursorcolumn

set encoding=chinese
"set encoding=gb18030

"set fileencoding=chinese
"set fileencodings=gbk,ucs-bom,utf-8,chinese
"set termencoding=chinese

"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=gb18030

set fileencodings=ucs-bom,gb18030,gbk,gb2312,cp936
"set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"set encoding=utf-8

set sw=4
set ts=4

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
"set backup		" keep a backup file
set t_Co=256
colorscheme molokai 
"colorscheme desert
set hlsearch
"set cc=81

filetype plugin on
"xu
"set ofu=syntaxcomplete#Complete
"autocmd FileType python　set
"omnifunc=pythoncomplete#Complete
"autocmd FileType python runtime! autoload/pythoncomplete.vim

"tools bar
"set guioptions-=T
set wildmenu 
"}

set backupdir=./.backup,~/.backup,/tmp

" TagList set
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

nmap <F2> <esc>i<space><esc>la<space><esc>
nmap <F8> :NERDTreeToggle<cr>
nmap <F7> :!indent -kr -i8  %<cr>
nmap <F9> :TagbarToggle<CR>
"pydiction 1.2 python auto complete
let g:pydiction_location = '~/.vim/after/complete-dict'
"defalut g:pydiction_menu_height == 15
"let g:pydiction_menu_height = 20
"
let g:syntastic_cpp_include_dirs = ['.', '/home/work/local/python-2.7/include/python2.7','/home/work/huangfei/env/*']

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

" Only do this part when compiled with support for autocommands.
if has("autocmd")

	" Enable file type detection.
	" Use the default filetype settings, so that mail gets 'tw' set to 72,
	" 'cindent' is on in C files, etc.
	" Also load indent files, to automatically do language-dependent indenting.
	"依据文件类型设置自动缩进
	filetype plugin indent on

	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		" Remove ALL autocommands for the current group.
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		"
		" 特定文本显示行号
		autocmd FileType python,c,cpp,vim,bash,sh,shell set number

		"txt2tags
		autocmd BufNewFile,BufRead *.t2t set ft=txt2tags 

		" PYTHON Unittest
		autocmd FileType python compiler pyunit
		autocmd FileType python setlocal makeprg=python\ ./alltests.py
		autocmd BufNewFile,BufRead test*.py setlocal makeprg=python\ %
		"au BufNewFile,BufRead *.py,*.pyw setf python
		" skeleton file
		" 自动使用新文件模板
		autocmd BufNewFile test*.py 0r ~/.vim/skeleton/test.py
		autocmd BufNewFile alltests.py 0r ~/.vim/skeleton/alltests.py
		autocmd BufNewFile *.py 0r ~/.vim/skeleton/skeleton.py
		autocmd BufNewFile *.sh 0r ~/.vim/skeleton/skeleton.sh
		autocmd BufNewFile *.h 0r ~/.vim/skeleton/skeleton.h
		autocmd BufNewFile *.cpp 0r ~/.vim/skeleton/skeleton.cpp

		"tabstop ts TAB占多少位置 set ts=4
		"shiftwidth sw 每层缩进的空格 set sw=4
		"(no)expandtab (no)et 开启tab扩展
		"softtabstop sts backspace删除的空格数
		"(no)smarttab (no)sta 开启时,行首Tab为sw个空格,否则为ts个空格
		autocmd FileType python setlocal et sta sw=4 sts=4 
		autocmd FileType c,cpp setlocal et sta sw=4 sts=4 
		" autocmd FileType c,cpp set cindent

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

	augroup END

else
	set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif

if has('mouse')
	set mouse-=a
endif

if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.  
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical 
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif


hi comment ctermfg=6



"vundle, YouCompleteMe
"set nocompatible  
"filetype off  
"set rtp+=~/.vim/bundle/Vundle.vim  
"call vundle#begin()  
"Plugin 'gmarik/Vundle.vim'  
"Plugin 'Valloric/YouCompleteMe'  
"call vundle#end()  
"filetype plugin indent on  

