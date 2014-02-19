#!/bin/bash

_bundle()
{
  local cur prev command

  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  COMPREPLY=()

  OPTIONS="--no-color --verbose"
  COMMANDS="config exec install package update"
  UTILS="check console gem help init list open \
    outdated platform show version viz"

  # complete initial bundle command
  if [ $COMP_CWORD -le 1 ]; then
    COMPREPLY=($(compgen -W "$COMMANDS $UTILS" -- $cur))
    return 0
  fi

  # find the given bundle command
  command="${COMP_WORDS[1]}"

  # add command-specific options
  case "$command" in
  help)
    if [ $COMP_CWORD -le 2 ]; then
      COMPREPLY=($(compgen -W "$COMMANDS $UTILS" -- $cur))
    fi
    ;;
  check)
    OPTIONS="$OPTIONS --gemfile --path --dry-run"
    ;;
  gem)
    OPTIONS="$OPTIONS --bin"
    ;;
  init)
    OPTIONS="$OPTIONS --gemspec"
    ;;
  install)
    OPTIONS="$OPTIONS --gemfile --path --system --without --local --deployment \
      --binstubs --shebang --standalone --quiet --no-cache"
    ;;
  list|show)
    OPTIONS="$OPTIONS --paths"
    ;;
  outdated)
    OPTIONS="$OPTIONS --pre --source --local"
    ;;
  platform)
    OPTIONS="$OPTIONS --ruby"
    ;;
  update)
    OPTIONS="$OPTIONS --source"
    ;;
  viz)
    OPTIONS="$OPTIONS --file --version --requirements --format"
    ;;
  *)
    ;;
  esac

  # complete additional flags when $cur starts with "-"
  # or commands, binaries… when "bundle exec" is given
  case "$cur" in
  -*)
    COMPREPLY=($(compgen -W "$OPTIONS" -- $cur))
    ;;
  *)
    if [ $command = "exec" ]; then
      if [ $COMP_CWORD -le 2 ]; then
        COMPREPLY=($(compgen -c -o bashdefault -- $cur))
      else
        COMPREPLY=($(compgen -o filenames -- $cur))
      fi
    fi
    ;;
  esac

  return 0
}

complete -o bashdefault -o default -F _bundle bundle 2>/dev/null \
  || complete -o default -F _bundle bundle
