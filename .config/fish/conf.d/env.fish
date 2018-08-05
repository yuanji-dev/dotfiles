set -gx theme_nerd_fonts yes
set -gx theme_color_scheme terminal
set -gx EDITOR vim
set -gx PATH $HOME/.local/bin $PATH

if status --is-interactive
    keychain --eval --quiet -Q id_rsa | source
end
