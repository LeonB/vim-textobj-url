runtime! plugin/yank_url.vim

describe 'yank_url'
    before
    end

    " http://www.google.com/test
    " http://www.google.com/test
    " http://regexr.com/foo.html?q=bar
    " Test clipboard options

    after
        bufdo bdelete!
    end
end
