#!/usr/bin/env python3
import shlex
import subprocess


def playerctl(*arguments):
    command = ["playerctl"] + list(arguments)
    result = subprocess.run(command, capture_output=True, text=True, shell=False)

    if result.returncode != 0:
        print(result.stdout)
        print("ERROR")
        exit(1)

    return result.stdout


for instance in playerctl("--list-all").splitlines():
    if playerctl("-p", instance, "status").strip().lower() == "playing":
        print(playerctl("-p", instance, "metadata", "--format", '{{ title }} - {{artist }} ').strip())

