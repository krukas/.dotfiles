# Dotfiles

Personal dotfiles for SwayWM desktop

## Install for Opensuse Tumbleweed

```bash
./opensuse
```

## Manual steps to complete setup

### Auto unlock keyring on login

Add the following lines to `/usr/lib/pam.d/greetd`:

```
# Under last auth line:
auth       optional     pam_gnome_keyring.so
# Under last session line:
session    optional     pam_gnome_keyring.so auto_start
```

More info: https://wiki.archlinux.org/title/GNOME/Keyring

### Auto display (kanshi)

Create a config file `~/.config/kanshi/config`, and use `swaymsg -t get_outputs` to get output names:

```
profile {
        output eDP-1 enable mode 3840x2400 position 0,0 scale 2
}

profile {
        # Home
        output "Iiyama North America PL2770QS 1183210701438" enable mode 2560x1440 position 0,0 scale 1
        output eDP-1 disable
}

profile {
        # Work (fallback)
        output "DP-3" enable mode 3840x2160 position 0,0 scale 1.5
        output eDP-1 disable
}
```
