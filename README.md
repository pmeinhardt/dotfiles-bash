# ~ is where the ♥ is

## install

  1. `git clone git@github.com:pmeinhardt/dotfiles.git ~/.dotfiles`
  2. `cd ~/.dotfiles`
  3. `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

For configurations you wouldn't want to see in a public repository, `~/.localrc` is the place to keep them.

## editing

Steadily improving your dotfiles? Edit and `reload!`, bang!

## thanks

I started off by boldly adapting from [Zach Holman](https://github.com/holman)'s neat [dotfiles](https://github.com/holman/dotfiles), trimming down on parts and pulling in pieces from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Gianni Chiappetta](https://github.com/gf3/dotfiles), [Jan Moesen](https://github.com/janmoesen/tilde), ...
