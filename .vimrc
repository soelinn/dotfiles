" .vimrc for VIM

" ====================================================================================================
" General Settings
" ====================================================================================================
set nocompatible
set noswapfile   " No swap
set number       " Show line numbers


" ====================================================================================================
" Indentation and Tabbing
" ====================================================================================================
" Enable filetype for setting file-type specific settings such as SPACE v.s TAB indentation
" https://vim-jp.org/vimdoc-en/autocmd.html
" https://vim-jp.org/vimdoc-en/filetype.html
filetype on
filetype plugin on
filetype indent on " file-type based indentation

set expandtab    " Use spaces instead of tabs
set shiftwidth=4 " One tab == four spaces
set tabstop=4    " One tab == four spaces

" for C-like  programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c,cpp,java set formatoptions+=ro
autocmd FileType c set omnifunc=ccomplete#Complete

" indent CSS content inside braces
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" HTML tag auto-complete
autocmd FileType xhtml,html set omnifunc=htmlcomplete#CompleteTags

" XML tag auto-complete
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags

" set indentation shiftwidth=2 (two spaces) for various languages
autocmd FileType css,html,xhtml,vim,xml,xslt set shiftwidth=2 softtabstop=2

" Makefile
" don't expand TAB as SPACEs because leading tab characters are needed per syntax.
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" ====================================================================================================
" Syntax Highlighting
" ====================================================================================================
syntax enable
