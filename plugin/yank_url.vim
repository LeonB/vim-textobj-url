
" http://www.google.com/test
" http://www.google.com/test
" http://regexr.com/foo.html?q=bar
" a href="//jquery.com/jquery.1.10.min.js?blaat=ding">Dit is een test!</a>

func! s:YankUrl()
    let line = getline('.')
    let url = s:getUrl(line)

    if url == ''
        return
    endif

    " Paste the url in the unnamed (default) register
    let @@ = url
    echo 'Url "' . url . '" yanked'
endfunction

func! s:getUrl(line)
    " Copied from http://mathiasbynens.be/demo/url-regex
    " and converted to a vim regex with the help of eregex.vim
    let regex = '\c\<\(\%([a-z][0-9A-Za-z_-]?:\%(\/\{1,3}\|[a-z0-9%]\)\|www\d\{0,3}[.]\|[a-z0-9.\-]\+[.][a-z]\{2,4}\/\)\%([^ \t()<>]\+\|(\([^ \t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\)\+\%((\([^ \t()<>]\+\|\(([^ \t()<>]\+)\)\)*)\|[^ \t`!()[\]{};:'."'".'".,<>?«»“”‘’]\)\)'

    let url = matchstr(a:line, regex)
    return url
endfunction

command! YankUrl call s:YankUrl()
