" make sure pdf compilation works properly
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_MultipleCompileFormats = 'pdf'

" set the compilation preferences for all the other file formats
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'

function CompileXeTexNow()
    let oldCompileRule=g:Tex_CompileRule_pdf
    let g:Tex_CompileRule_pdf = 'xelatex -aux-directory=F:/Vim/my_latex_doc/temp --synctex=-1 -src-specials -interaction=nonstopmode $*'
    call Tex_RunLaTeX()
    let g:Tex_CompileRule_pdf=oldCompileRule
endfunction
map <Leader>lx :<C-U>call CompileXeTexNow()<CR>
