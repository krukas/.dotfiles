#!/usr/bin/env bash
# We do sh command in file because helix has no keymap labels
zellij run -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi-picker.sh
