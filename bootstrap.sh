#! /usr/bin/bash
items=(
    "ack"
    "compton"
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
