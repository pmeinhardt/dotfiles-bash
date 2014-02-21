#!/bin/sh

# Installs the Terminal.app color scheme $SCHEME.
#
# Assumes a $SCHEME.terminal file is present
# in the same directory as this script.

cd $(dirname $0)

DIRNAME=$(pwd)
SCHEME="Tomorrow Night Bright"

if test $(which osascript); then
  installed=$(osascript \
    -e "tell application \"Terminal\"" \
    -e "  if not (get name of (get default settings)) is \"$SCHEME\" then" \
    -e "    return 1" \
    -e "  else" \
    -e "    return 0" \
    -e "  end if" \
    -e "end tell"
  )

  if test "$installed" != "0"; then
    echo "Installing Terminal color scheme '$SCHEME'..."

    osascript \
      -e "tell application \"Terminal\"" \
      -e "  open POSIX file \"$DIRNAME/$SCHEME.terminal\"" \
      -e "  delay 1" \
      -e "  close window 1" \
      -e "  set newscheme to (first settings set whose name is \"$SCHEME\")" \
      -e "  set default settings to newscheme" \
      -e "  repeat with termwindow in (get every window)" \
      -e "    set current settings of termwindow to newscheme" \
      -e "  end repeat" \
      -e "end tell"
  fi
fi
