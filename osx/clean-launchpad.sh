# Clean up unwanted items from Launchpad
if [ ! -e ~/Library/Application\ Support/Dock/*.db ]; then
  exit 0
fi

# Remove installer and uninstaller icons
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title like "%install%"'

# Remove some Adobe items (Flash and the like)
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title like "%flash player%"'
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title like "%adobe flash%"'
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title = "naib"'
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from groups where title like "%adobe flash%"'
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from groups where title like "%adobe fireworks%"'

# Remove Creative Suite uninstaller
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title like "%adobe creative suite%"'

# Remove Caffeine
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title = "Caffeine"'

# Remove Bamboo Utility
sqlite3 ~/Library/Application\ Support/Dock/*.db 'delete from apps where title = "Bamboo Utility"'

# Restart Launchpad
killall Dock
