#! /usr/bin/bash
items=(
    "ack"
    "picom"
    "dunst"
    "zsh"
    "fontconfig"
    "git"
    "i3"
    "libinput-gestures"
    "misc"
    "nvim"
    "rofi"
    "ssh"
    "termite"
)

for item in "${items[@]}" ; do
    stow -t $HOME -R ${item}
    echo "${item} done."
done
