#!/usr/bin/env bash

source "$HOME/.asdf/asdf.sh"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add python https://github.com/asdf-community/asdf-python.git

asdf install
