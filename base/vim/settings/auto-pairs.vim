"System Shortcuts:
"    <CR>  : Insert new indented line after return if cursor in blank brackets or quotes.
"    <BS>  : Delete brackets in pair
"    <M-p> : Toggle Autopairs (g:AutoPairsShortcutToggle)
"    <M-e> : Fast Wrap (g:AutoPairsShortcutFastWrap)
"    <M-n> : Jump to next closed pair (g:AutoPairsShortcutJump)
"    <M-b> : BackInsert (g:AutoPairsShortcutBackInsert)
"
"If <M-p> <M-e> or <M-n> conflict with another keys or want to bind to another keys, add
"
"    let g:AutoPairsShortcutToggle = '<another key>'
let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutJump = '<C-a>'
"let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairsShortcutFastWrap = '<C-e>'
