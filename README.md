# Dotfiles

Personal dotfiles for SwayWM desktop

## Install for Opensuse Tumbleweed

```bash
./opensuse
```

## Manual steps to complete setup

### Auto unlock keyring on login

Add the following lines to `/etc/pam.d/greetd`:

```
# Under last auth line:
auth       optional     pam_gnome_keyring.so
# Under last session line:
session    optional     pam_gnome_keyring.so auto_start
```

More info: https://wiki.archlinux.org/title/GNOME/Keyring
