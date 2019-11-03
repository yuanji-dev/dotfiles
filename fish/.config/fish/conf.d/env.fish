set -g theme_nerd_fonts yes
set -g theme_color_scheme dracula
set -gx EDITOR vim
set -gx GOPATH $HOME/.go
set -gx PATH $HOME/.local/bin $HOME/.go/bin $GOPATH/bin /opt/android-sdk/build-tools/28.0.3 /usr/lib/jvm/default/bin $PATH
set -gx fish_emoji_width 2

if status --is-interactive
    keychain --eval --quiet -Q id_ed25519 | source
    keychain --eval --agents gpg --quiet -Q 3CB6EA7C55827AAD | source
end
