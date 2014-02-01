" Name:     A fossil scm wrapper
" Author:   J Knight <emptyvee@gmail.com>
" URL:      http://github.com/mtvee/vim-fossil
" License:  OSI approved MIT licence
" Created:  On a boat in a river
" Modified: 2014 Feb 01
" Version:  0.2

if exists('g:loaded_fossil_scm') || &cp
  finish
endif
let g:loaded_fossil_scm = 1

" {{{ commands

command! -nargs=0  Fdiff  :call s:FossilSDiff()
command! -nargs=0  Fvdiff  :call s:FossilVDiff()
command! -nargs=0  Fstatus  :call s:FossilStatus()
command! -nargs=0  Fextra  :call s:FossilExtra()
command! -nargs=+  Fcommit   !fossil commit -m <q-args>
command! -nargs=+  Fadd   !fossil add <q-args>
command! -nargs=+  Faddr   !fossil addremove <q-args>
command! -nargs=0  Fchanges  !fossil changes
command! -nargs=0  Ftimeline  :call s:FossilTimeline()
command! -nargs=1  Fclone  !fossil clone <q-args>
command! -nargs=1  Fopen  !fossil open <q-args>
" }}}
" {{{ functions
let scrbufnr=0

function! s:createScratch() abort
  :enew
  :setlocal buftype=nofile
  :setlocal bufhidden=wipe
  :setlocal ft=fossil-status
  :setlocal noswapfile
  :setlocal nomodified nonumber scrollbind nowrap foldcolumn=0 nofoldenable
  if exists('+concealcursor')
    :setlocal concealcursor=nc conceallevel=2
  endif
  if exists('+relativenumber')
    :setlocal norelativenumber
  endif
endfunction

function! s:FossilVDiff() abort
  :vsplit
  call s:FossilDiff()
endfunction

function! s:FossilSDiff() abort
  :split
  call s:FossilDiff()
endfunction

function! s:FossilDiff() abort
  call s:createScratch()
  :silent r ! fossil diff
endfunction

function! s:FossilExtra() abort
  :split
  call s:createScratch()
  :silent r ! fossil extra
endfunction

function! s:FossilStatus() abort
  :split
  call s:createScratch()
  :silent r ! fossil status
endfunction

function! s:FossilTimeline(...) abort
  :split
  call s:createScratch()
  :silent r ! fossil timeline 
endfunction
" }}}
" {{{ licence
" ---------------------------------------------------------------------
"
" Copyright (c) 2014 J Knight
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" }}}

