#!/bin/bash

# Function to back up and write a boolean default
backup_and_write_bool() {
    local domain=$1
    local key=$2
    local value=$3

    if defaults read "${domain}" "${key}" &> /dev/null; then
        local current_value=$(defaults read "${domain}" "${key}")
        echo "defaults write ${domain} ${key} -bool ${current_value}" >> backup.sh
    fi

    defaults write "${domain}" "${key}" -bool ${value}
}

# Function to back up and write an integer default
backup_and_write_int() {
    local domain=$1
    local key=$2
    local value=$3

    if defaults read "${domain}" "${key}" &> /dev/null; then
        local current_value=$(defaults read "${domain}" "${key}")
        echo "defaults write ${domain} ${key} -int ${current_value}" >> backup.sh
    fi

    defaults write "${domain}" "${key}" -int ${value}
}

# Function to back up and write a string default
backup_and_write_string() {
    local domain=$1
    local key=$2
    local value=$3

    if defaults read "${domain}" "${key}" &> /dev/null; then
        local current_value=$(defaults read "${domain}" "${key}")
        echo "defaults write ${domain} ${key} -string \"${current_value}\"" >> backup.sh
    fi

    defaults write "${domain}" "${key}" -string "${value}"
}

echo "Changing OSX system preferences"
echo "To restore these changes, run osx/backup.sh"

cd $(dirname "${BASH_SOURCE[0]}")

# Create backup, moving older backup if need be
if [ -f "backup.sh" ]; then
    mv -n "backup.sh" "backup-$(date -r "backup.sh" +"%Y%m%d_%H%M%S").sh"
fi
install /dev/null backup.sh

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Enable tap to click and for the login screen
backup_and_write_bool "com.apple.driver.AppleBluetoothMultitouch.trackpad" "Clicking" true
backup_and_write_int "NSGlobalDomain" "com.apple.mouse.tapBehavior" 1

# Display full POSIX path as Finder window title
backup_and_write_bool "com.apple.finder" "_FXShowPosixPathInTitle" true

# When performing a search, search the current folder by default
backup_and_write_string "com.apple.finder" "FXDefaultSearchScope" "SCcf"

# Set the icon size of Dock items to 16 pixels
backup_and_write_int "com.apple.dock" "tilesize" 16

# Hide indicator lights for open applications in the Dock
backup_and_write_bool "com.apple.dock" "show-process-indicators" false

# Show only active items in dock
backup_and_write_bool "com.apple.dock" "static-only" true

# Automatically hide and show the Dock
backup_and_write_bool "com.apple.dock" "autohide" true

# Don’t show recent applications in Dock
backup_and_write_bool "com.apple.dock" "show-recents" false

# Remove the auto-hiding Dock delay
backup_and_write_int "com.apple.dock" "autohide-delay" 0

# Remove the animation when hiding/showing the Dock
backup_and_write_int "com.apple.dock" "autohide-time-modifier" 0

# Apply Dock settings
killall Dock

# Set iTerm custom settings
backup_and_write_bool "com.googlecode.iterm2" "LoadPrefsFromCustomFolder" true
backup_and_write_string "com.googlecode.iterm2" "PrefsCustomFolder" "$(dirname $(pwd))/iTerm"

# Quit printer app when done
backup_and_write_bool "com.apple.print.PrintingPrefs" "Quit When Finished" true

# Enable the Develop menu and the Web Inspector in Safari
backup_and_write_bool "com.apple.Safari" "IncludeDevelopMenu" true
backup_and_write_bool "com.apple.Safari" "WebKitDeveloperExtrasEnabledPreferenceKey" true
backup_and_write_bool "com.apple.Safari" "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" true

# Disable virtual desktop animation
backup_and_write_bool "com.apple.finder" "DisableAllAnimations" true

# Don't warn about applications downloaded from the Internet
backup_and_write_bool "com.apple.LaunchServices" "LSQuarantine" false

# Don’t automatically rearrange Spaces based on most recent use
backup_and_write_bool "com.apple.dock" "mru-spaces" false

# Hide Siri from menu bar
backup_and_write_bool "com.apple.siri" "StatusMenuVisible" false

# Apply menu settings
sudo killall -HUP cfprefsd
sudo killall SystemUIServer

# Set background
echo "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(osascript -e 'tell app "finder" to get posix path of (get desktop picture as alias)')\"'" >> backup.sh
eval "osascript -e 'tell application \"Finder\" to set desktop picture to POSIX file \"$(dirname $(pwd))/pics/bg.png\"'"

PAM_FILE="/etc/pam.d/sudo"
PAM_CONFIG="pam_tid.so"

# Enable TouchID for sudo
if ! grep -q "$PAM_CONFIG" $PAM_FILE; then
  # Backup current PAM_CONFIG
  echo "sudo mv osx/sudo.bak $PAM_FILE" >> backup.sh
  sudo cp $PAM_FILE ./sudo.bak
  
  sudo cp ./sudo $PAM_FILE
fi
