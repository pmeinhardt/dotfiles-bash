#!/bin/sh

if test ! $(which lein); then
  echo "Installing leiningen"
  brew install leiningen > /tmp/leiningen-install.log
fi
