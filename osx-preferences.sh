#!/bin/bash

echo "Changing OSX system preferences"
echo "To restore these changes, run ./osx-backup.sh"

cd $(dirname "${BASH_SOURCE[0]}")

# Create backup, moving older backup if need be
if [ -f "osx-backup.sh" ]; then
    mv -n "osx-backup.sh" "osx-backup-$(date -r "osx-backup.sh" +"%Y%m%d_%H%M%S").sh"
fi
install /dev/null osx-backup.sh

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Enable tap to click and for the login screen
echo "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool $([ $(defaults read com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
echo "defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int $(defaults -currentHost read NSGlobalDomain com.apple.mouse.tapBehavior )" >> osx-backup.sh
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
echo "defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int $(defaults read NSGlobalDomain com.apple.mouse.tapBehavior )" >> osx-backup.sh
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Disable backswipe on trackpads
echo "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool $([ $(defaults read com.google.Chrome AppleEnableSwipeNavigateWithScrolls ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false
echo "defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool $([ $(defaults read com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.google.Chrome.canary AppleEnableSwipeNavigateWithScrolls -bool false

# Display full POSIX path as Finder window title
echo "defaults write com.apple.finder _FXShowPosixPathInTitle -bool $([ $(defaults read com.apple.finder _FXShowPosixPathInTitle ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
echo "defaults write com.apple.finder FXDefaultSearchScope -string "$(defaults read com.apple.finder FXDefaultSearchScope )"" >> osx-backup.sh
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Set the icon size of Dock items to 16 pixels
echo "defaults write com.apple.dock tilesize -int $(defaults read com.apple.dock tilesize )" >> osx-backup.sh
defaults write com.apple.dock tilesize -int 16

# Hide indicator lights for open applications in the Dock
echo "defaults write com.apple.dock show-process-indicators -bool $([ $(defaults read com.apple.dock show-process-indicators ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.dock show-process-indicators -bool false

# Remove all apps from dock
echo "defaults write com.apple.dock persistent-apps -array $(defaults read com.apple.dock persistent-apps | tr -d '\n')" >> osx-backup.sh
defaults write com.apple.dock persistent-apps -array

# Show only active items in dock
echo "defaults write com.apple.dock static-only -bool $([ $(defaults read com.apple.dock static-only ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.dock static-only -bool true

# Automatically hide and show the Dock
echo "defaults write com.apple.dock autohide -bool $([ $(defaults read com.apple.dock autohide ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.dock autohide -bool true

# Don’t show recent applications in Dock
echo "defaults write com.apple.dock show-recents -bool $([ $(defaults read com.apple.dock show-recents ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.dock show-recents -bool false

# Remove the auto-hiding Dock delay
echo "defaults write com.apple.dock autohide-delay -float $(defaults read com.apple.dock autohide-delay )" >> osx-backup.sh
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
echo "defaults write com.apple.dock autohide-time-modifier -float $(defaults read com.apple.dock autohide-time-modifier )" >> osx-backup.sh
defaults write com.apple.dock autohide-time-modifier -float 0

# Apply Dock settings
killall Dock

# Set iTerm custom settings
echo "defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool $(defaults read com.googlecode.iterm2 LoadPrefsFromCustomFolder)" >> osx-backup.sh
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
echo "defaults write com.googlecode.iterm2 PrefsCustomFolder -string $(defaults read com.googlecode.iterm2 PrefsCustomFolder)" >> osx-backup.sh
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$(pwd)/iTerm"

# Quit printer app when done
echo "defaults write com.apple.print.PrintingPrefs \"Quit When Finished\" -bool $([ $(defaults read com.apple.print.PrintingPrefs "Quit When Finished" ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Enable the Develop menu and the Web Inspector in Safari
echo "defaults write com.apple.Safari IncludeDevelopMenu -bool $([ $(defaults read com.apple.Safari IncludeDevelopMenu ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.Safari IncludeDevelopMenu -bool true
echo "defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool $([ $(defaults read com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
echo "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool $([ $(defaults read com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Disable virtual desktop animation
echo "defaults write com.apple.finder DisableAllAnimations -bool $([ $(defaults read com.apple.finder DisableAllAnimations ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.finder DisableAllAnimations -bool true

# Dont warn about applications downloaded from the internet
echo "defaults write com.apple.LaunchServices LSQuarantine -bool $([ $(defaults read com.apple.LaunchServices LSQuarantine ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Don’t automatically rearrange Spaces based on most recent use
echo "defaults write com.apple.dock mru-spaces -bool $([ $(defaults read com.apple.dock mru-spaces ) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.dock mru-spaces -bool false

# Hide Siri from menu bar
echo "defaults write com.apple.siri StatusMenuVisible -bool $([ $(defaults read com.apple.siri StatusMenuVisible) == 1 ] && echo "true" || echo "false")" >> osx-backup.sh
defaults write com.apple.siri StatusMenuVisible -bool false
# TODO: add com.mortennn.Dozer

# Apply menu settings
sudo killall -HUP cfprefsd
sudo killall SystemUIServer

# Set background
echo "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')\"'" >> osx-backup.sh
eval "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(pwd)/pics/bg.png\"'"
