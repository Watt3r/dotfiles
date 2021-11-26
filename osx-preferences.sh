echo "Changing OSX system preferences"

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Enable tap to click and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable backswipe on trackpads
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set the icon size of Dock items to 8 pixels 
defaults write com.apple.dock tilesize -int 8 

# Hide indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool false 

# Remove all apps from dock
defaults write com.apple.dock persistent-apps -array

# Show only active items in dock
defaults write com.apple.dock static-only -bool true

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Apply Dock settings
killall Dock

# Quit printer app when done
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Disable virtual desktop animation
defaults write com.apple.finder DisableAllAnimations -bool true

# Dont warn about applications downloaded from the internet
defaults write com.apple.LaunchServices LSQuarantine -bool NO

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Hide Siri from menu bar
defaults write com.apple.siri StatusMenuVisible -bool false
# TODO: add com.mortennn.Dozer

# Apply menu settings
sudo killall -HUP cfprefsd
sudo killall SystemUIServer

# Set background
cd $(dirname "${BASH_SOURCE[0]}")
eval "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(pwd)/pics/bg.png\"'"
