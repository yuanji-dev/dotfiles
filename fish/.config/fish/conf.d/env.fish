set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula
set -gx EDITOR vim
set -gx PATH $HOME/.local/bin $PATH
set -gx GOPATH $HOME/Projects/gobook
set -gx fish_emoji_width 2

if status --is-interactive
    keychain --eval --quiet -Q id_ed25519 | source
    keychain --eval --agents gpg --quiet -Q 3CB6EA7C55827AAD | source
end
