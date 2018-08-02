set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx theme_nerd_fonts yes

if status --is-interactive
    keychain --eval --quiet -Q id_rsa | source
end
