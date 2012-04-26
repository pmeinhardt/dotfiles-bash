# set history options

export HISTSIZE=10000           # expand the history list
export HISTFILESIZE=10000       # max lines of the history file
export HISTCONTROL=ignoredups   # don't record dups in history

# more...

# shopt -sq cdspell
shopt -sq histappend
shopt -sq histverify
# shopt -sq nocaseglob
# shopt -sq nocasematch
# shopt -sq nullglob
