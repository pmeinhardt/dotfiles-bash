#!/bin/sh

if test ! -e $(brew --prefix)/etc/bash_completion; then
  echo "Installing bash-completion"
  brew install bash-completion > /tmp/bash-completion-install.log
fi
