#!/bin/sh

if test ! $(which rbenv); then
  echo "Installing rbenv"
  brew install rbenv > /tmp/rbenv-install.log
fi

if test ! $(which ruby-build); then
  echo "Installing ruby-build"
  brew install ruby-build > /tmp/ruby-build-install.log
fi
