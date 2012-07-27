# rbenv init - https://github.com/sstephenson/rbenv/#-23-neckbeard-configuration
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi
