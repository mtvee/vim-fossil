
if exists("b:current_syntax")
  finish
endif

runtime! syntax/diff.vim

syn match fHeader  "^[a-zA-Z\-]*\: "
syn match fEdited  "^EDITED"
syn match fAdded   "^ADDED"
syn match fDeleted "^DELETED"
syn match fTLDate  "=\{3} [0-9\-]* =\{3}"
syn match fHash    "^[0-9:]\{8} \[[0-9a-f]\{10}\] "

hi def link fEdited  PreProc
hi def link fAdded   Special
hi def link fDeleted Constant
hi def link fTLDate  Title
hi def link fHash    Identifier
hi def link fHeader  Comment

let b:current_syntax = "fossil-status"

