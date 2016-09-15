inoremap jj <Esc>
noremap tt :tabnew<CR>
set fileencodings=utf-8,cp1251
execute pathogen#infect()
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" pass a path where Vundle should install plugins
call vundle#begin('~/.vim/bundle/')

" let Vundle manage Vundle, required
Plugin 'Vundle.vim'
Plugin 'supertab'
Plugin   'EditPlus'
Plugin 'svn.vim'
Plugin 'highlight-cursor'
Plugin 'DNA-sequence-highlighter'
Plugin 'https://bitbucket.org/mortonfox/twitvim' "Helptags
Plugin 'https://github.com/suan/vim-instant-markdown'
Plugin 'https://github.com/rupa/v'
Plugin 'https://github.com/dohsimpson/vim-macroeditor'
Plugin 'https://github.com/vim-scripts/bash-support.vim'
Plugin 'https://github.com/francoiscabrol/ranger.vim'
Plugin 'https://github.com/tpope/vim-fugitive'
Plugin 'tmhedberg/SimpylFold'
Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim' 
Plugin 'https://github.com/austintaylor/vim-commaobject'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}           
Plugin 'https://github.com/scrooloose/syntastic'
Plugin 'https://github.com/othree/html5.vim'
Plugin 'https://github.com/docteurklein/php-getter-setter.vim'
Plugin 'joonty/vdebug'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'
Plugin 'https://github.com/artur-shaik/vim-javacomplete2'
Plugin 'https://github.com/rhysd/open-pdf.vim'
Plugin 'Chiel92/vim-autoformat'
call vundle#end()            " required
filetype plugin on
filetype plugin indent on    " required
syntax on
set background=dark
set report=2
set undolevels=50
set history=1000
set number
set noautoread
set ignorecase
set smartcase
set foldmethod=indent
set foldlevel=99
set laststatus=2
set cmdheight=1
set modeline
set splitbelow
set undofile
set undodir=~/.vimundo/
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
map <F4> :bdelete<CR>
nnoremap <leader>ss :setlocal spell! spelllang=bg_bg
map <F12> :!./%
:nnoremap <F5> :buffers<CR>:buffer<Space>
let g:ranger_map_keys = 0
let g:ranger_open_new_tab = 1
map <leader>ff :Ranger<CR>.
:nnoremap <F6> :set list! listchars=space:·,tab:·· <CR>
:nnoremap <F7> :set number!<CR>
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>
cmap w!! w !sudo tee % >/dev/null
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set rtp+=/home/zahari/packages/pysmell/


" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set noruler
set clipboard=unnamedplus
let twitvim_count = 200
let twitvim_browser_cmd = 'firefox --new-tab '

" pdf automatic handling
let g:pdf_convert_on_edit=1
let g:pdf_convert_on_read=1

"vim as calculator - type ;bc
vnoremap ;bc "ey:call CalcBC()<CR>
function! CalcBC()
	  let has_equal = 0
	    " remove newlines and trailing spaces
	       let @e = substitute (@e, "\n", "", "g")
	      let @e = substitute (@e, '\s*$', "", "g")
	        " if we end with an equal, strip, and remember for output
		   if @e =~ "=$"
		       let @e = substitute (@e, '=$', "", "")
		    let has_equal = 1
		      endif
		        " sub common func names for bc equivalent
			   let @e = substitute (@e, '\csin\s*(', "s (", "")
			  let @e = substitute (@e, '\ccos\s*(', "c (", "")
			    let @e = substitute (@e, '\catan\s*(', "a (", "")
			      let @e = substitute (@e, "\cln\s*(", "l (", "")
			        " escape chars for shell
				   let @e = escape (@e, '*()')
				"     " run bc, strip newline
				       let answer = substitute (system ("echo " . @e . " \| bc -l"), "\n", "", "")
				  " append answer or echo
				     if has_equal == 1
				         normal `>
				             exec "normal a" . answer
				               else
				                   echo "answer = " . answer
				                     endif
			                     endfunction

"map cyrillic characters to their latin equivelents in Bulgarian Phonetic
"layout
map а a
map А A
map б b
map Б B
map в w
map В W
map Г G
map гг gg
map д d
map Д D
map дд dd
map е e
map Е E
map ж v
map Ж V
map з z
map З Z
map ЗЗ ZZ
map и i
map И I
map й j
map Й J
map йй jj
map к k
map К K
map л l
map Л L
map м m
map М M
map н n
map Н N
map о o
map О O
map п p
map П P
map р r
map Р R
map с s
map С S
map т t
map Т T
map у u
map У U
map ф f
map Ф F
map Х H
map ц c
map Ц C
map ч `
map Ч ~
map ш <[>
map ш {
map щ <]>
map щ }
map ъ y
map Ъ Y
map ъъ yy
map ь x
map Ь X
map ю \
map юю \\
" map Ю |
map я q
map Я Q
map № #
map € ^
map § &

"Handle Control+Arrows
map [1;5A ?^\n<CR>
map! [1;5A <ESC>?^\n<CR>i
map [1;6A v^
map [1;5B /^\n<CR>
map! [1;5B <ESC>/^\n<CR>i
map [1;6B v$h
map [1;5C w
map! [1;5C <ESC>wi
map [1;6C vw
map [1;5D b 
map! [1;5D <ESC>bi
map [1;6D vb

autocmd FileType python setlocal omnifunc=pysmell#Complete
let g:SimpylFold_docstring_preview=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

autocmd FileType java setlocal omnifunc=javacomplete#Complete

