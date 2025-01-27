#!/usr/bin/env python3
import shlex
import subprocess
import argparse


def get_first_active_player():
    result = subprocess.run(["playerctl", "--list-all"], capture_output=True, text=True, shell=False)
    if result.returncode != 0:
        return False
    players = result.stdout.splitlines()
    for player in players:
        status = playerctl(player, "status").strip().lower()
        if status == "playing":
            # TODO: Maybe store last player
            return player
    return players[0] if players else False


def playerctl(player, *arguments):
    command = ["playerctl", "-p", player] + list(arguments)
    result = subprocess.run(command, capture_output=True, text=True, shell=False)

    if result.returncode != 0:
        exit(0)

    return result.stdout


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog='Youtube media controls')
    parser.add_argument('command')
    args = parser.parse_args()

    player = get_first_active_player()

    if not player:
        exit(0)

    if args.command == "play":
        playerctl(player, "play")
    elif args.command == "pause":
        playerctl(player, "pause")
    elif args.command == "toggle":
        playerctl(player, "play-pause")
    elif args.command == "waybar":
        icon = ""
        status = playerctl(player, "status").strip().lower()
        if status == "playing":
            icon = ""
        elif status == "paused":
            icon = ""

        print(icon, playerctl(player, "metadata", "--format", '{{ trunc(title, 32) }} - {{ trunc(artist, 16) }} ').strip(), " ")
