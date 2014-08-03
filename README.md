# A Vim plugin to easily yank urls

This plugin adds a command to easily yank urls. It does it by detecting if
there's an url on the current line. If there is one, it is yanked into the
default register.

## Installation

I recommend using [Tim Pope's pathogen
plugin](https://github.com/tpope/vim-pathogen), [Shougo's NeoBundle
plugin](https://github.com/Shougo/neobundle.vim) or [Gmarik's Vundle
plugin](https://github.com/gmarik/Vundle.vim) to install this.

## Usage

The plugin provides a `:YankUrl` command but it would be a lot easier to
configure a mapping for it. I use this:

```
nmap <leader>yu :YankUrl<cr>
```

Now go to a Vim buffer with a url in it. Jump to the line with the url and hit
`<leader>yu`. Now _only_ the url is yanked.

## License

Same terms as Vim itself (see `license`)
