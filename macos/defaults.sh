#!/bin/zsh
cd `dirname $0`

# Close any open System Preferences panes, to prevent them from overriding
# settings you are about to change
osascript -e 'tell application "System Preferences" to quit'
# killall System\ Preferences

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until this script has finished
#while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

#--------------------
# General
#--------------------

# Set dark mode
defaults write NSGlobalDomain AppleInterfaceStyle -string Dark

# Show scroll bars: Always
defaults write NSGlobalDomain AppleShowScrollBars -string Always

# Ask to keep changes when closing documents
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -bool true

# Restore open documents and windows when re-opened
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

#--------------------
# Desktop & Screen Saver
#--------------------

# Disable screensaver
defaults -currentHost write com.apple.screensaver idleTime -int 0

# Hot corners (Bottom-Left, Show Desktop)
# This setting should be done manually.

#--------------------
# Dock
#--------------------

# Set magnification on
defaults write com.apple.dock magnification -bool true

# Icon size
defaults write com.apple.dock tilesize -int 40
defaults write com.apple.dock largesize -int 60

# Double-click a window's title bar to zoom
defaults write NSGlobalDomain AppleActionOnDoubleClick -string Maximize

# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Show indicators for open applications
defaults write com.apple.dock show-process-indicators -bool true

# Show recent applications in Dock
defaults write com.apple.dock show-recents -bool true


# **Unpublic settings**

# Remove the auto-hiding delay
defaults write com.apple.dock autohide-delay -float 0

# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

#--------------------
# Mission Control
#--------------------

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

#--------------------
# Siri
#--------------------

# See below "Menu bar"

#--------------------
# Spotlight
#--------------------

# TODO: Exclude some directories (mainly external drives)

#--------------------
# Language & Region
#--------------------

# 日付の書式設定等は変更のたびに下部の表示例を動的に変えているっぽい

#--------------------
# Notification
#--------------------

# Do Not Disturb
# Turn on DND When the display is sleeping
defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplaySleep -bool true

# Turn on DND When the display is locked
defaults -currentHost write com.apple.notificationcenterui dndEnabledDisplayLock -bool true

#--------------------
# Internet Accounts
#--------------------

#--------------------
# Wallet & Apple Pay
#--------------------

#--------------------
# Touch ID
#--------------------

#--------------------
# Users & Groups
#--------------------

# See below "Menu bar" (Login Options)

#--------------------
# Accessibility
#--------------------

# Pointer Control

# Double-click speed (threshold)
defaults write NSGlobalDomain com.apple.mouse.doubleClickThreshold -float 0.2

# Spring-loading delay
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0.5


# Trackpad option

# Maximize scrolling speed
defaults write NSGlobalDomain com.apple.trackpad.scrolling -float 1

# Enable three-finger drag
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool true

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true


# Mouse Keys option Alternate Control Methods

# # Press the Option key five times to toggle Mouse Keys
defaults write com.apple.universalaccess useMouseKeysShortcutKeys -bool true

# # Ignore built-in trackpad when Mouse Keys is on
defaults write com.apple.universalaccess mouseDriverIgnoreTrackpad -bool true

#--------------------
# Screen Time
#--------------------

#--------------------
# Extensions
#--------------------

#--------------------
# Security & Privacy
#--------------------

# May not be configurable by defaults command


#--------------------
# Software Update
#--------------------

# May not be configurable by defaults command

#--------------------
# Network
#--------------------

#--------------------
# Bluetooth
#--------------------

# See below "Menu bar"

#--------------------
# Sound
#--------------------

#--------------------
# Printers & Scanners
#--------------------

#--------------------
# Keyboard
#--------------------

# See below "Menu bar"


# Keyboard

# **Unpublic settings**

# Set Key Repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# Set Delay Until Repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 13


# Text

# Disable automatic spelling correction
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Turn off smart quote/dash substitution
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Shortcuts

# Switching to the next window
# Default is Command + F1.
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 27 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>96</integer><integer>50</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"

# input sources
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>32</integer><integer>49</integer><integer>262144</integer></array><key>type</key><string>standard</string></dict></dict>"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "<dict><key>enabled</key><true/><key>value</key><dict><key>parameters</key><array><integer>106</integer><integer>38</integer><integer>1048576</integer></array><key>type</key><string>standard</string></dict></dict>"

# Spotlight
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"

# IME setting seems to be difficult to configure by defaults command.
# This setting should be done by manually.


# Touch Bar (Keyboard > Customize Control Strip)

# Erase Siri
defaults write com.apple.controlstrip MiniCustomized -array com.apple.system.brightness com.apple.system.volume com.apple.system.mute
killall ControlStrip

#--------------------
# Trackpad
#--------------------

# Click by tapping
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

# Maximize speed of cursor
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3

# Make click silent (only for MacBook series before 2016)
# see also: https://support.apple.com/ja-jp/HT204352
#defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0

# Enable Expose gesture
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

#--------------------
# Mouse
#--------------------

#--------------------
# Displays
#--------------------

# You only can enable HiDPI display mode manually.

# Show mirroring options in menu bar when available
defaults write com.apple.airplay showInMenuBarIfPresent -bool true

#--------------------
# Sidecar
#--------------------

#--------------------
# Energy Saver
#--------------------

# See below "Menu bar"

IS_LAPTOP=$(/usr/sbin/system_profiler SPHardwareDataType | grep "Model Identifier" | grep "Book")
if [[ "$IS_LAPTOP" != "" ]]; then
  sudo pmset -b displaysleep 10 disksleep 15 sleep 15 lessbright 0
  sudo pmset -c displaysleep 120 disksleep 180 sleep 180
  sudo pmset -a standbydelaylow 1800 standbydelayhigh 10800
else
  sudo pmset displaysleep 180 disksleep 0 sleep 0 halfdim 1
fi

#--------------------
# Date & Time
#--------------------

# Disable auto setting of timezone
sudo defaults write /Library/Preferences/com.apple.timezone.auto Active -bool false

# Clock
# See below "Menu bar"

#--------------------
# Sharing
#--------------------

#--------------------
# Time Machine
#--------------------

# See below "Menu bar"

#--------------------
# Startup Disk
#--------------------



#--------------------
# Menu bar
#--------------------

# Since there are many changes on menu bar in macOS Big Sur,
# These settings should be done manually for a while.

: << COMMENTOUT

# $ defaults read com.apple.systemuiserver
# see also: /System/Library/CoreServices/Menu\ Extras


# Erase Siri (confirmed valid for macOS 10.15.7 and 11.2.3)
# The second line is confirmed unnecessary, but actually modified when manipulated by GUI.
defaults write com.apple.Siri StatusMenuVisible -bool false
#defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false

# Users & Groups > Login Options (fast user switch menu)
#defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.appleuser" -bool true
defaults write NSGlobalDomain userMenuExtraStyle -int 2

# Bluetooth
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true

# Keyboard (Input Sources)
defaults write com.apple.menuextra.textinput ModeNameVisible -bool false

# Energy Saver (battery status)
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Date & Time (Clock)
#defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm:ss"

# Time Machine
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.TimeMachine" -bool true


# Show icons on menu bar
# Note that the order of icons is statically decided after `killall SystemUIServer`
defaults write com.apple.systemuiserver menuExtras -array \
"/System/Library/CoreServices/Menu Extras/Clock.menu" \
"/System/Library/CoreServices/Menu Extras/Battery.menu" \
"/System/Library/CoreServices/Menu Extras/AirPort.menu" \
"/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
"/System/Library/CoreServices/Menu Extras/Volume.menu" \
"/System/Library/CoreServices/Menu Extras/Displays.menu" \
"/System/Library/CoreServices/Menu Extras/TextInput.menu" \
"/System/Library/CoreServices/Menu Extras/Bluetooth.menu"

killall SystemUIServer

COMMENTOUT

#--------------------
# Finder
#--------------------

# General

# Set path of new window target.
# Choose one from following options.

# Computer
#defaults write com.apple.finder NewWindowTarget -string "PfCm"

# Volume (root directory)
#defaults write com.apple.finder NewWindowTarget -string "PfVo"
#defaults write com.apple.finder NewWindowTargetPath -string "file:///"

# Home
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

# Desktop
#defaults write com.apple.finder NewWindowTarget -string "PfDe"
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# Documents
#defaults write com.apple.finder NewWindowTarget -string "PfDo"
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Documents/"

# iCloud Drive
#defaults write com.apple.finder NewWindowTarget -string "PfID"
#defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Library/Mobile%20Documents/com~apple~CloudDocs/"

# Recents
#defaults write com.apple.finder NewWindowTarget -string "PfAF"
#defaults write com.apple.finder NewWindowTargetPath -string "file:///System/Library/CoreServices/Finder.app/Contents/Resources/MyLibraries/myDocuments.cannedSearch"

# Other Locations
#defaults write com.apple.finder NewWindowTarget -string "PfLo"
##defaults write com.apple.finder NewWindowTargetPath -string "file:///any/location/"


# Advanced

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Don't show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search,
# "SCev": Search This Mac
# "SCcf": Search the Current Folder
# "SCcp": Use the Previous Search Scope
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


# **Unpublic settings**

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
# Notice: The longer window titles are, the harder they are to read.
#defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


#--------------------
# iTerm2
#--------------------

# Preferences file currently synced by `Backup and Sync from Google` (Google Drive)

#--------------------
# Activity Monitor
#--------------------

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Dock icon (CPU History)
defaults write com.apple.ActivityMonitor IconType -int 6

# Show all processes in Activity Monitor
# TODO: Check valid values
#defaults write com.apple.ActivityMonitor ShowCategory -int 0

#--------------------
# Photos
#--------------------

# Prevent Photos from opening automatically when devices are plugged in
# TODO: Check validity
#defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

#--------------------
# Others
#--------------------

# **Unpublic settings**

# Remove shadow from captured screenshots
defaults write com.apple.screencapture disable-shadow -boolean true

# Change the default directory which screenshots are saved in
# Check validity
#defaults write com.apple.screencapture location ~/Pictures/ScreenShots/


# Enable Touch ID authentication in terminal (gnu-sed required. To install: brew install gnu-sed)

: << COMMENTOUT

# if Touch ID is already enabled for sudo command;
if cat /etc/pam.d/sudo | grep "pam_tid.so" >/dev/null 2>&1; then
  :
else
  sudo gsed -i -e "2iauth       sufficient     pam_tid.so" /etc/pam.d/sudo
fi

COMMENTOUT

# killall
# TODO: Reboot is preferable ?

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

echo "Configuration completed successfully."
echo "Reboot the computer so that changes are surely applied."
