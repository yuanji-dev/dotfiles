#! /usr/bin/bash
items=(
    "ack"
    "compton"
    "fish"
    "fontconfig"
    "git"
    "i3"
    "i3blocks"
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
