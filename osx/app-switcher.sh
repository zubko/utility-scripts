# show app switchter on all displays

defaults write com.apple.Dock appswitcher-all-displays -bool true
killall Dock
