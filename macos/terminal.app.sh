#!/bin/zsh
cd `dirname $0`

#--------------------
# Terminal
#--------------------

# Use a modified version of the Solarized Dark theme by default in Terminal.app
# if 'wget' command is already installed;
if type -a wget >/dev/null 2>&1; then
  :
else
  zsh homebrew.sh
fi

# Regardless of whether "Solarized Dark" color theme is installed to Terminal.app or not,
# the script below is executed because it is idempotent.

osascript <<EOD
tell application "Terminal"

  local allOpenedWindows
  local initialOpenedWindows
  local windowID
  set themeDir to "../others/"
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
