#!/bin/sh

if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" 2>&1 | tee /tmp/homebrew-install.log
  brew tap homebrew/science
fi
