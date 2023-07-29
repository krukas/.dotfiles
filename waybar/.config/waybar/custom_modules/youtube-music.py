#!/usr/bin/env python3
import shlex
import subprocess
import argparse


# Because off Firefox flatpak bug its always the same:
# https://bugzilla.mozilla.org/show_bug.cgi?id=1666084
# You must disable hardware controls for normal firefox browser:
# about:config -> media.hardwaremediakeys.enabled 
INSTANCE = "firefox.instance2"


def playerctl(*arguments):
    command = ["playerctl", "-p", INSTANCE] + list(arguments)
    result = subprocess.run(command, capture_output=True, text=True, shell=False)

    if result.returncode != 0:
        exit(0)

    return result.stdout


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog='Youtube media controls')
    parser.add_argument('command')
    args = parser.parse_args()

    if INSTANCE not in playerctl("--list-all").splitlines():
        exit(0)

    if args.command == "play":
        playerctl("play")
    elif args.command == "pause":
        playerctl("pause")
    elif args.command == "toggle":
        playerctl("play-pause")
    elif args.command == "waybar":
        icon = ""
        status = playerctl("status").strip().lower()
        if status == "playing":
            icon = ""
        elif status == "paused":
            icon = ""

        print(icon, playerctl("metadata", "--format", '{{ title }} - {{artist }} ').strip())
