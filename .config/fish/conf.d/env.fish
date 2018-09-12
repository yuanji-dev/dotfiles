set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula
set -gx EDITOR vim
set -gx PATH $HOME/.local/bin $PATH

if status --is-interactive
    keychain --eval --quiet -Q id_rsa | source
end
