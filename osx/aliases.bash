if [[ ! "$OSTYPE" =~ ^darwin11 ]]; then return 1; fi

# Rest a little and activate the screen lock, if locking is enabled.
alias zz='open /System/Library/Frameworks/ScreenSaver.framework/Versions/Current/Resources/ScreenSaverEngine.app'
