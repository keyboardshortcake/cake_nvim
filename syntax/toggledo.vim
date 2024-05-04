" Vim syntax file
" Language: This is a toggledo file
" Maintainer: 
" Latest revision: Jan 16, 2024

if exists("b:current_syntax")
    finish
endif

" Keywords
syn match toggledodone "^\s*\[\s*x\].*"
syn match toggledotodo "\[ \]\%(\s*\[ \]\)*" "This matches any [ ] symbol (two brackets and a space between) anywhere in the file.
" syn match toggledotodo "^\s*\[\s\].*" " this matches all the lines that have [ ] at the start
" syn match toggledotodotext "\[ \]\%(\s*\[ \]\)*\zs.*" contained
" syn match toggledotodotext "\[ \]\%(\s*\[ \]\)*\zs.*"
" syn match toggledocurrent "^\s*[\*\].*$" "Matches any whole line that starts with [*] allowing leading whitespace"
" syn match toggledocurrent "^\s*[\*\].*$" "Matches any whole line that starts with [*] allowing leading whitespace"
syn match toggledocurrent "^\s*\[\*\].*" " this matches all the lines that have [ ] at the start
syn match toggledonote "^\s*\-.*" "Trying to match things that start with a dash

let b:current_syntax = "toggledo"

" :hi <-- shows you some other options to use here
" hi def link toggledotodo CurSearch
" hi def link toggledotodo Comment
hi def link toggledonote Comment
" hi def link toggledotodo DevIconVim
hi def link toggledotodo OutlineCurrent
hi def link toggledotodotext CurSearch
" hi def link toggledodone Comment
hi def link toggledodone NonText "this one is super dark
" hi def link toggledocurrent CurSearch
" hi def link toggledocurrent WindowPickerWinBar
" hi def link toggledocurrent String " I like this one but trying the one
" below for now so I can see it more urgently
hi def link toggledocurrent TodoBgFIX

" old experiments below
" syn keyword toggledoimportant @important 
" syn keyword toggledourgent @urgent
" syn keyword toggledodoable @doable
" syn match toggledotodo "^\[\s\]" " this just matches the first [ ] sign
" syn match toggledotodo "^\[\s\].*" " this matches the whole first line that starts with the [ ] sign
" syn match toggledotodo "^\s*\[\s\].*" " this matches all the lines that have [ ] at the start
" syn match toggledodone "^\s*\[\x\].*" " this matches all the lines that have [ ] at the start
" syn match toggledotodo "^\s*\[\s\]\zs.*"
" syn match toggledotodo "^\s*\[\s\]\zs\s*"
" syn match toggledotodo "^\s*\[\s\]\s*"
" syn match toggledotodo "^\s*\[\zs\s*\]\s*"
" syn match toggledotodo "^\s*\[\s\]\s*"
" syn match togledodone "^\[x]"
" hi def link toggledoimportant Todo
" hi def link toggledodoable Comment
" hi def link toggledotodo Statement
