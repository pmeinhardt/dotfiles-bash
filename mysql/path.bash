if [ -d /usr/local/mysql ]; then
  export PATH="$PATH:/usr/local/mysql/bin"
  export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib"
fi
