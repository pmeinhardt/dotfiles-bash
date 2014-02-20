#!/bin/sh

if test ! $(which node); then
  echo "Installing node"
  brew install node > /tmp/node-install.log
fi
