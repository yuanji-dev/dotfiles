#! /usr/bin/bash
items=(
    "zsh"
    "git"
    "tig"
    #"libinput-gestures"
    "misc"
    #"nvim"
    "ssh"
    "chromium"
    "gnupg"
    "fonts"
    "fontconfig"
    "pacman"
)

for item in "${items[@]}" ; do
    stow -t $HOME -R ${item}
    echo "${item} done."
done
