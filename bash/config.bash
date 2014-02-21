# set shell history variables

export HISTSIZE=10000           # expand the history list
export HISTFILESIZE=10000       # max lines of the history file
export HISTCONTROL=ignoredups   # don't record dups in history

# colorize output

export CLICOLOR=1
export GREP_OPTIONS="--color=auto"

# more settings... (run `shopt` to see available options)

# shopt -sq cdspell
shopt -sq histappend
shopt -sq histverify
# shopt -sq nocaseglob
# shopt -sq nocasematch
# shopt -sq nullglob
