"========================================================
" Highlight All Math Operator
"========================================================
" C math operators
syn  match         cMathOperator     display  "[-+\*/%=]"
" C pointer operators
syn  match         cPointerOperator display  "->\|\."
" C logical    operators - boolean results
syn  match         cLogicalOperator display  "[!<>]=/="
syn  match         cLogicalOperator display  "=="
" C bit operators
syn  match         cBinaryOperator display  " /( & /| | /| /^ /| << /| >> /) =/="
syn  match         cBinaryOperator display  "\~"
syn  match         cBinaryOperatorError display  "\~="
" More C logical operators - highlight in preference to binary
syn  match         cLogicalOperator display  "&&\|||"
syn  match         cLogicalOperatorError display  "\(&&/|||\)="
" Math Operator
hi  def link  cMathOperator             cOperator
hi  def link  cPointerOperator          cOperator
hi  def link  cLogicalOperator          cOperator
hi  def link  cBinaryOperator           cOperator
hi  def link  cLogicalOperator          cOperator

hi  cOperator   ctermfg=darkgreen gui =NONE  guifg =#B5A1FF 
hi  def link  cBinaryOperatorError      Error
hi  def link  cLogicalOperatorError     Error

"========================================================
" Highlight typedef types ( include cpp syntax... )
" =======================================================
syn  match        cTypeDefType  "/</I/i*/> /( &/=/s*/*/=/s*&/=/I /) /@="
syn  match        cTypeDefType  "/</I/i*::/i* /( &/=/s*/*/=/s*&/=/I /) /@="  contains=cScope,cFunction
syn  match        cTypeDefType  "/</I /( /i*</s*/I/i*/s*>:: /) /+/i* /( &/=/s*/*/=/s*&/=/I /) /@="  contains=cScope,cFunction,cTypeDefTypeTwo
syn  match        cTypeDefTypeTwo       "</s*/I/i*/s*>"  contains=cLogicalOperator

hi  cTypeDefType guifg =#c0d8f8
hi  cTypeDefTypeTwo      guifg =#c0d8f8

" Highlight ;
syn  match        sColon        display  /;/
syn  match        cScope        display  /::/
hi  cScope       guifg =#3EFFE2
hi  sColon       guifg =#60d080
"========================================================
" Highlight All Function
"========================================================
syn  match     cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
syn  match     cFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>\s*("me=e-1
hi  cFunction  ctermfg=blue gui =NONE  guifg =#B5A1FF

syn  match     cMacro "\<[A-Z_][A-Z_0-9]*\>\s*("me=e-1
hi  cMacro ctermfg=lightblue gui =NONE  guifg =#15A1FF
