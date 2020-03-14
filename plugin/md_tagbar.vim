let s:save_cpo = &cpo
set cpo&vim

let s:script_path = expand('<sfile>:p:h:h').'/bin/markdown2ctags.py'

if !exists('g:tagbar_type_markdown')
  let g:tagbar_type_markdown = {
      \ 'ctagstype': 'markdown',
      \ 'ctagsbin' : 'python',
      \ 'ctagsargs' : s:script_path . ' -f - --sort=yes --sro=::',
      \ 'kinds' : [
          \ 's:sections',
          \ 'i:images'
      \ ],
      \ 'sro' : '::',
      \ 'kind2scope' : {
          \ 's' : 'section',
      \ },
      \ 'sort': 0,
  \ }
endif

let g:tagbar_type_ghmarkdown = g:tagbar_type_markdown
let g:tagbar_type_rmd = g:tagbar_type_markdown

let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker:noexpandtab:ts=2:sts=2:sw=2
