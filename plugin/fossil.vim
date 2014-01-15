" fossil.vim - A fossil scm wrapper
" Maintainer:  J Knight
" Version:     0.1
"

"if exists('g:loaded_fossil_scm') || &cp
"  finish
"endif
let g:loaded_fossil_scm = 1

" Setting up commands

command! -nargs=0  Fdiff  :call s:FossilSDiff()
command! -nargs=0  Fvdiff  :call s:FossilVDiff()
command! -nargs=0  Fstatus  :call s:FossilStatus()
command! -nargs=+  Fcommit  !cd %:h && fossil commit %:t -m <q-args>
command! -nargs=0  Fchanges  !fossil changes
command! -nargs=0  Ftimeline  :call s:FossilTimeline()
command! -nargs=1  Fclone  !fossil clone <q-args>
command! -nargs=1  Fopen  !fossil open <q-args>


function! s:createScratch() abort
  :enew
  :setlocal buftype=nofile
  :setlocal bufhidden=hide
  :setlocal noswapfile
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
  :set ft=diff
  :silent r ! fossil diff
endfunction

function! s:FossilStatus() abort
  :split
  call s:createScratch()
  :set ft=fossil-status
  :silent r ! fossil status
endfunction

function! s:FossilTimeline(...) abort
  :split
  call s:createScratch()
  :set ft=fossil-status
  :silent r ! fossil timeline 
endfunction

