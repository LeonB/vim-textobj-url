runtime! plugin/textobj/url.vim

" http://mathiasbynens.be/demo/url-regex
let s:correct_urls = [
            \ 'http://foo.com',
            \ 'http://www.google.com',
            \ 'http://www.example.com/foo/?bar=baz&inga=42&quux',
            \ 'mailto:me@mydomain.com',
            \ 'file:///home/leon/test.txt',
            \ ]

let s:incorrect_urls = [
            \ 'http://',
            \ 'foo.com',
            \ ]

let s:filler_line = [
\   'Lorem ipsum dolor sit amet, consectetur adipisicing elit,',
\   'sed do eiusmod tempor incididunt ut labore et dolore magna',
\   'aliqua. Ut enim ad minim veniam, quis nostrud exercitation',
\   'ullamco laboris nisi %placeholder% aliquip ex ea commodo consequat.',
\   'Duis aute irure dolor in reprehenderit in voluptate velit',
\   'esse cillum dolore eu fugiat nulla pariatur. Excepteur sint',
\   'occaecat cupidatat non proident, sunt in culpa qui officia',
\   'deserunt mollit anim id est laborum.',
\ ]

function! s:fillBuffer()
  put = s:filler_line
  1 delete _
endfunction

function! s:cleanBuffer()
    bufdo! bdelete!
    new
endfunction

function! s:prepareBuffer(url)
    call s:fillBuffer()
    execute "%sno#%placeholder%#" . a:url
endfunction

function! s:theLastRegion()
  return [visualmode(), [line("'<"), col("'<")], [line("'>"), col("'>")]]
endfunction
" execute 'normal' "2Gvasd\<Esc>"
" Expect TheLastRegion() ==# ['v', [1, 4], [3, 6]]

describe 'textobj_Url'
    before
        call s:cleanBuffer()
    end

    it 'should set g:loaded_textobj_url'
        Expect exists('g:loaded_textobj_url') == 1
    end
end

describe 'url matching'
    it 'should not match incorrect urls'
        for url in s:correct_urls
            call s:cleanBuffer()
            put = url

            " Do vau
            norm "xyau

            " Expect the register to be the same as the url
            Expect @x == url
        endfor
    end

    it 'should match correct urls'
        for url in s:incorrect_urls
            call s:cleanBuffer()
            put = url

            " Do vau
            norm "xyau

            " Expect the register to be the same as the url
            Expect @x != url
        endfor
    end
end


describe 'cursor position'
    it 'should match with the cursor before the url'
        let url = s:correct_urls[0]
        call s:cleanBuffer()
        call s:prepareBuffer(url)

        " Go to line 4
        4

        " Jump to beginning of line
        norm 0

        " Do vau
        norm "xyau

        " Expect the register to be the same as the url
        Expect @x == url
    end

    " it 'should match with the cursor after the url'
    "     let url = s:correct_urls[0]
    "     call s:cleanBuffer()
    "     call s:prepareBuffer(url)

    "     " Go to line 4
    "     4

    "     " Jump to end of line
    "     norm $

    "     " Do vau
    "     norm "xyau

    "     " Expect the register to be the same as the url
    "     Expect @x == url
    " end

    " it 'should not match other lines'
    "     let url = s:correct_urls[0]
    "     call s:cleanBuffer()
    "     call s:prepareBuffer(url)

    "     " Go to line 4
    "     2

    "     " Jump to beginning of line
    "     norm 0

    "     " Do vau
    "     norm "xyau

    "     " Expect the register to be empty
    "     Expect @x == ""
    " end
end
