#!/bin/sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'
# killall System\ Preferences

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Change default shell from bash to zsh
if [[ $(dscl . -read /Users/$USER UserShell) = "UserShell: /bin/zsh" ]]; then
  :
else
  sudo dscl . -create /Users/$USER UserShell /bin/zsh
fi

#--------------------
# General
#--------------------

# Set dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark

# Show scroll bar always
defaults write NSGlobalDomain AppleShowScrollBars -string Always

# 書類を閉じるときに変更内容を保持するかどうかを確認する
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# アプリケーションを終了するときにウインドウを閉じず次回復元する
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

#--------------------
# Desktop & Screen Saver
#--------------------

# Disable screensaver
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Hot corners (Bottom-Left, Show Desktop)
# NOTICE: if you put 'sudo' before commands, preferences may not be propagated correctly.
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-bl-corner -int 4

#--------------------
# Dock
#--------------------

# size
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -int 60

# Window title bar double click
defaults write NSGlobalDomain AppleActionOnDoubleClick -string Maximize

# Minimize to application
defaults write com.apple.dock minimize-to-application -bool true

# Disable launch animation
defaults write com.apple.dock launchanim -bool false

# Enable autohide
defaults write com.apple.dock autohide -bool true

# Show indicator
defaults write com.apple.dock show-process-indicators -bool true

# Show recents
defaults write com.apple.dock show-recents -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

#--------------------
# Mission Control
#--------------------

#--------------------
# Language & Region
#--------------------

# 日付の書式設定等は変更のたびに下部の表示例を動的に変えているっぽい

#--------------------
# Security & Privacy
#--------------------

# May not be configurable by defaults command

#--------------------
# Spotlight
#--------------------

# TODO: excluding

#--------------------
# Notification
#--------------------

#--------------------
# Displays
#--------------------

# Enable HiDPI display modes (requires restart)
# ?
# sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# Show mirroring option on menu bar if available
defaults write com.apple.airplay showInMenuBarIfPresent -bool true

#--------------------
# Energy Saver
#--------------------

IS_LAPTOP=$(/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier" | grep "Book")
if [[ "$IS_LAPTOP" != "" ]]; then
  sudo pmset -b displaysleep 5 disksleep 10 sleep 15 lessbright 0 halfdim 1
  sudo pmset -c displaysleep 180 disksleep 0 sleep 0
else
  sudo pmset sleep 0 disksleep 0 displaysleep 180 halfdim 1
fi

#--------------------
# Keyboard
#--------------------

# Increase key repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# Decrease key repeat delay

defaults write -g InitialKeyRepeat -int 13

# Keyboard shortcut settings seem to be difficult to configure by defaults command

#--------------------
# Mouse
#--------------------

#--------------------
# Trackpad
#--------------------

# Click by tapping
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Maximize speed of cursor
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# Make click silent (only for MacBook series before 2016)
# see also: https://support.apple.com/ja-jp/HT204352
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# Enable Expose gesture
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

#--------------------
# Printers & Scanners
#--------------------

#--------------------
# Sound
#--------------------

#--------------------
# Startup Disk
#--------------------

#--------------------
# iCloud
#--------------------

#--------------------
# Internet Accounts
#--------------------

#--------------------
# Wallet & Apple Pay
#--------------------

#--------------------
# Software Update
#--------------------

#--------------------
# Network
#--------------------

#--------------------
# Bluetooth
#--------------------

#--------------------
# Extensions
#--------------------

#--------------------
# Sharing
#--------------------

#--------------------
# Touch ID
#--------------------

#--------------------
# Users & Groups
#--------------------

#--------------------
# Parental Controls
#--------------------

#--------------------
# Siri
#--------------------

#--------------------
# Date & Time
#--------------------

# Disable auto setting of timezone
sudo defaults write /Library/Preferences/com.apple.timezone.auto Active -bool false

# see below "Menu bar"

#--------------------
# Time Machine
#--------------------

#--------------------
# Accessibility
#--------------------

# Mouse and Trackpad

# Set double click threshold
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 0.2

# Set spring loading delay
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5

# Trackpad option

# Maximize scroll speed
defaults write NSGlobalDomain com.apple.trackpad.scrolling -float 1

# Enable three-finger drag
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool true

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# Enable drag lock
#defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true
#defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

#--------------------
# Menu bar
#--------------------

# $ defaults read com.apple.systemuiserver
# see also: /System/Library/CoreServices/Menu\ Extras

# Clock
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

# IME
defaults write com.apple.menuextra.textinput ModeNameVisible -bool false

# Battery
defaults write com.apple.menuextra.battery ShowPercent -string "YES"


# Bluetooth
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true

# Time Machine
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool true

# VPN
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.vpn" -bool false


# Show icons on menu bar
# Note that the order of icons is statically decided after `killall SystemUIServer`
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/User.menu" \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/TextInput.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu" \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/VPN.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
"/System/Library/CoreServices/Menu Extras/TimeMachine.menu"

killall SystemUIServer

#--------------------
# Finder
#--------------------

# Set Desktop as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

#--------------------
# Terminal
#--------------------

# Use a modified version of the Solarized Dark theme by default in Terminal.app
# if 'wget' command is already installed;
if type -a wget >/dev/null 2>&1; then
  :
else
  sh homebrew.sh
fi

# mkdir excluded >/dev/null 2>&1
# wget -O "excluded/Solarized Dark.terminal" "https://raw.githubusercontent.com/tomislav/osx-terminal.app-colors-solarized/master/Solarized Dark.terminal"

# if "Solarized Dard" colorscheme is already installed in Terminal.app;
if defaults read com.apple.Terminal "Window Settings" | grep "Solarized Dark" >/dev/null 2>&1; then
  :
else

osascript <<EOD
tell application "Terminal"

  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeDir to "others/"
  set themeName to "Solarized Dark"

  (* Store the IDs of all the open terminal windows. *)
  set initialOpenedWindows to id of every window

  (* Open the custom theme so that it gets added to the list
     of available terminal themes (note: this will open two
     additional terminal windows). *)
  do shell script "open '" & themeDir & themeName & ".terminal'"

  (* Wait a little bit to ensure that the custom theme is added. *)
  delay 1

  (* Set the custom theme as the default terminal theme. *)
  set default settings to settings set themeName

  (* Get the IDs of all the currently opened terminal windows. *)
  set allOpenedWindows to id of every window

  repeat with windowID in allOpenedWindows

    (* Close the additional windows that were opened in order
       to add the custom theme to the list of terminal themes. *)
    if initialOpenedWindows does not contain windowID then
      close (every window whose id is windowID)

    (* Change the theme for the initial opened terminal windows
       to remove the need to close them in order for the custom
       theme to be applied. *)
    else
      set current settings of tabs of (every window whose id is windowID) to settings set themeName
    end if
  end repeat
end tell
EOD

fi

#--------------------
# iTerm2
#--------------------

# Install the Solarized Dark theme for iTerm
# if "Solarized Dark Modified" colorscheme is already installed;
if defaults read com.googlecode.iterm2 "Custom Color Presets" | grep "Solarized Dark Modified" >/dev/null 2>&1; then
  :
else
  open "others/Solarized Dark Modified.itermcolors"
fi

# Increase maximum memory consumption per session
defaults write com.googlecode.iterm2 IRMemory -int 64

# Disable copy selection
defaults write com.googlecode.iterm2 CopySelection -bool false

# Disable window adjusting by font size
defaults write com.googlecode.iterm2 AdjustWindowForFontSizeChange -bool false

# Increase tmux dashboard limit
defaults write com.googlecode.iterm2 TmuxDashboardLimit -int 30

# Don't show tab bar in full screen
defaults write com.googlecode.iterm2 ShowFullScreenTabBar -bool false

# Profile TODO

#--------------------
# Activity Monitor
#--------------------

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Dock icon
defaults write com.apple.ActivityMonitor IconType -int 2

# Show all processes in Activity Monitor (TODO: research)
#defaults write com.apple.ActivityMonitor ShowCategory -int 0

#--------------------
# Photos
#--------------------

# Prevent Photos from opening automatically when devices are plugged in (TODO: research)
#defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#--------------------
# Others
#--------------------

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Remove shadow from captured screenshots
defaults write com.apple.screencapture disable-shadow -boolean true

# Enable Touch ID authentication in terminal (require gnu-sed: brew install gnu-sed)
# if Touch ID is already enabled for sudo command;
if cat /etc/pam.d/sudo | grep "pam_tid.so" >/dev/null 2>&1; then
  :
else
  sudo gsed -i -e "2iauth       sufficient     pam_tid.so" /etc/pam.d/sudo
fi


# killall

for app in "Activity Monitor" \
  "cfprefsd" \
  "Dock" \
  "Finder" \
  "Google Chrome" \
  "Mail" \
  "Messages" \
  "Safari" \
  "SystemUIServer" \
  "Terminal"; do
  :#killall "${app}" &> /dev/null 2>&1
done

echo "Configuration is correctly finished."
echo "Please reboot the computer to ensure that changes are enabled."
