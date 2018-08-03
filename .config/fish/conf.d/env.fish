set -gx theme_nerd_fonts yes
set -gx theme_color_scheme terminal
set -gx EDITOR vim

if status --is-interactive
    keychain --eval --quiet -Q id_rsa | source
end
