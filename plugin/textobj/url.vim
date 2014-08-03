if exists('g:loaded_textobj_url')
  finish
endif

" Copied from http://mathiasbynens.be/demo/url-regex
" and converted to a vim regex with the help of eregex.vim
let s:regex = '\c\<\(\%([a-z][0-9A-Za-z_-]\+:\%(\/\{1,3}\|[a-z0-9%]\)\|www\d\{0,3}[.]\|[a-z0-9.\-]\+[.][a-z]\{2,4}\/\)\%([^ \t()<>]\+\|(\([^ \t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\)\+\%((\([^ \t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\|[^ \t`!()[\]{};:'."'".'".,<>?«»“”‘’]\)\)'

call textobj#user#plugin('url', {
\      '-': {
\       'pattern': s:regex,
\       'select': ['au', 'iu'],
\      },
\    })

let g:loaded_textobj_url = 1
