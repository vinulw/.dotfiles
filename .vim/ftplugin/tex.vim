" make sure pdf compilation works properly
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_MultipleCompileFormats = 'pdf'

" set the compilation preferences for all the other file formats
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
