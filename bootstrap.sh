#! /usr/bin/bash
items=(
    "zsh"
    "git"
    "tig"
    "ssh"
    "chrome"
    "misc"
    "gnupg"
    "pacman"
    "tmux"
)

for item in "${items[@]}" ; do
    stow -t $HOME -R ${item}
    echo "${item} done."
done
