#!/bin/sh

if test ! $(which grc); then
  echo "Installing grc..."
  brew install grc > /tmp/grc-install.log
fi
