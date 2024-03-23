# This file is read each time a login shell is started.
# All other interactive shells will only read .bashrc; this is particularly
# important for language settings, see below.

test -z "$PROFILEREAD" && . /etc/profile || true


# Wayland support: https://github.com/swaywm/sway/wiki/Running-programs-natively-under-wayland
MOZ_ENABLE_WAYLAND=1
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
_JAVA_AWT_WM_NONREPARENTING=1


# Fix portals
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway


# Default editor
export EDITOR=/usr/bin/helix

# Cargo
export PATH="$PATH:$HOME/.cargo/bin/"

# NPM
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules"

# Eza disable user/group color
export EZA_COLORS="uu=0:gu=0"
