echo "Changing OSX system preferences"
defaults write com.apple.dock autohide -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Enable the Develop menu and the Web Inspector in Safari
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
# Disable animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set background
cd $(dirname "${BASH_SOURCE[0]}") && pwd
eval "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(pwd)/pics/bg.png\"'"
