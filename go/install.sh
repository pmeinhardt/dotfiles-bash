#!/bin/sh

if test ! $(which go); then
  echo "Installing go"
  brew install go > /tmp/go-install.log
fi
