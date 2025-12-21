syntax clear cTodo
syntax keyword cTodo contained TODO XXX
syntax keyword cBug contained BUG FIXME
syntax keyword cNote contained NOTE INFO

syntax cluster cCommentGroup add=cTodo,cBug,cNote

highlight cTodo guibg=None guifg=Yellow gui=Underline
highlight cBug  guibg=Red guifg=White gui=Bold 
highlight cNote guibg=None guifg=Cyan gui=None
