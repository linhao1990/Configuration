"VIMIDE vimrc basic settings
"--------start---------
set fileencodings=ucs-bom,utf-8,cp936
set helplang=cn

set shiftwidth=4
set tabstop=4
set expandtab
set nobackup
set noswapfile
set nowb
set backspace=start,indent,eol
set nu!
set autoindent
set smartindent
set wrap

set noerrorbells
set novisualbell
set infercase "自动补全时区分大小写
set showcmd

set incsearch           " Incremental search
set autowrite           " Automatically save before commands like :next and :make

colorscheme desert

filetype plugin on
filetype indent on

syntax on
set ruler

vmap <C-c> "+y
set mouse=a

" options for vim note
let g:notes_directory='~/Documents/Notes'
let g:notes_tagsindex='~/Documents/Notes/tags.txt'
let g:notes_suffix='.txt'
let g:notes_indexfile='~/Documents/Notes/index.txt'


"execute the following when you want to specify your vimrc
"export VIMINIT='so /shared/path/.vimrc | let $MYVIMRC = "/shared/path/.vimrc"'

autocmd BufNewFile *.h exe ":call InsertHeadDef()"
autocmd BufNewFile *.cpp exe ":call InsertCppInclude()"
autocmd BufNewFile *.sh,*.php,*.py,*.rb exec ":call SetTitle()"

autocmd BufNewFile,BufRead *.[ch],*.cpp set foldmethod=syntax
autocmd BufNewFile,BufRead *.py,*.sh,*.java,*.php set foldmethod=indent

function InsertCppInclude()
    let sourcefilename=expand("%:t")
    let headfilename=substitute(sourcefilename,'.cpp','.h','g')
    call setline(1, '//'.sourcefilename)
    call setline(2, '')
    call setline(3, '#include "'.headfilename.'"')
    call setline(4, '')
    call setline(5, '')
    normal ==5G
endfunction
function InsertHeadDef()
    let sourcefilename=expand("%:t")
    let definename=substitute(sourcefilename,' ','','g')
    let definename=substitute(definename,'\.','_','g')
    let definename = toupper(definename)
    call setline(1, '//'.sourcefilename)
    call setline(2, '')
    call setline(3, '#ifndef _'.definename.'_')
    call setline(4, '#define _'.definename.'_')
    call setline(5, '')
    call setline(6, '')
    call setline(7, '')
    call setline(8, '#endif')
    normal ==6G
endfunction
func SetTitle()
    if &filetype == 'sh'
        call append(0, "\#!/bin/bash")
    elseif &filetype == 'python'
        call append(0, "\#!/usr/bin/python")
        call append(1, "\# -*- coding: utf-8 -*-")
    elseif &filetype == 'ruby'
        call append(0, "\#!/usr/bin/ruby")
    endif
endfunction

"map :w :up
"map :q :confirm q

autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype ruby nnoremap <F4> :w <bar> exec '!ruby '.shellescape('%')<CR>
