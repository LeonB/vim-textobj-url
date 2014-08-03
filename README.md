# vim-textobj-uri

Vim plugin that adds a new `url` text object

## Installation

I recommend using [Tim Pope's pathogen
plugin](https://github.com/tpope/vim-pathogen), [Shougo's NeoBundle
plugin](https://github.com/Shougo/neobundle.vim) or [Gmarik's Vundle
plugin](https://github.com/gmarik/Vundle.vim) to install this.

To install this plugin with NeoBundle:

```
NeoBundle 'LeonB/vim-textobj-url', {'depends': 'kana/vim-textobj-user'}
```

This plugin depends on
[vim-textobj-user](https://github.com/kana/vim-textobj-user) so make sure that's
installed.

## Usage

This plugins adds a `au` and a `iu` text object.

A couple of examples (the cursor is represented by `|`):

- This is`|` a link to Google: http://www.google.com
- `ciu`
- This is a link to Google: `|`

---

- &lt;a href=&quot;mailto:me@myhomepage.com&quot;&gt;E-mail `|`me!&lt;/a&gt;
- `vau`
- &lt;a href=&quot;__mailto:me@myhomepage.com__`|`&quto;&gt;E-mail me!&lt;/a&gt;

## License

Same terms as Vim itself (see `license`)
