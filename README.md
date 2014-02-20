# ~ is where the ♥ is

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

## install

Run this:

    git clone https://github.com/pmeinhardt/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    ./script/bootstrap
    ./script/install

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

For configurations you wouldn't want to see in a public repository,
`~/.localrc` is the place to keep them.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.bash` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `./script/bootstrap`.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.bash**: Any files ending in `.bash` get loaded into your
  environment.
- **topic/path.bash**: Any file named `path.bash` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.bash**: Any file named `completion.bash` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your
  dotfiles but still keep those autoloaded files in your home directory.
  These get symlinked in when you run `make bootstrap`.

## updating

To update your dotfiles and install additions run

    $DTS/script/update
    $DTS/script/install

Keep installed software up-to-date with the regular `brew` commands

    brew outdated
    brew update
    brew upgrade

## thanks

I started off by boldly adapting from [Zach Holman](https://github.com/holman)'s neat [dotfiles](https://github.com/holman/dotfiles), trimming down on parts and pulling in pieces from [Mathias Bynens](https://github.com/mathiasbynens/dotfiles), [Gianni Chiappetta](https://github.com/gf3/dotfiles), [Jan Moesen](https://github.com/janmoesen/tilde), ...
