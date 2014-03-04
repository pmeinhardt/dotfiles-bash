# Switch between using Apple LLVM GCC and GNU GCC.
#
# Assumes GNU GCC is installed in /usr/local/gcc and was configured accordingly.
# Otherwise, gcc tool and library search paths may be set up incorrectly, break-
# ing your builds. You can verify that GNU GCC was built correctly by running
# `/usr/local/gcc/bin/gcc -print-search-dirs` from your command-line and making
# sure search paths point to GNU GCCs install location.
#
# Works by prepending (or removing) GNU GCC's binary directory to yor PATH.
#
# If you decide to install GNU GCC in a different place,
# just change the value of `gnubin`.

function switch-gcc {
  local gnubin="/usr/local/gcc/bin"

  if [ ! -x $gnubin/gcc ]; then
    echo "GNU GCC not found in expected location: ${gnubin}" 1>&2
    return 1
  fi

  if [ $(which gcc) != "${gnubin}/gcc" ]; then
    export PATH=$gnubin:$PATH
    export CXX=$gnubin/g++
    export CC=$gnubin/gcc
  else
    export PATH=${PATH//$gnubin\:/}
    unset CXX
    unset CC
  fi
}
