#####################################################################
# zplug
#####################################################################

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

#####################################################################
# zsh
#####################################################################

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#####################################################################
# common
#####################################################################
#
export EDITOR=vim
export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.local/bin:$GOPATH/bin

alias ls='exa'
alias ll='ls -alh'
alias shin='mosh shin'
alias edo='mosh edo'
alias ll='ls -alh'
alias cat=bat
alias vim=nvim
alias pbcopy='xsel --clipboard --input'
alias webfs='webfsd -F -r'
alias rei8='sudo systemctl restart i8kmon.service'
alias reiwd='sudo systemctl restart iwd.service'

function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

eval `keychain --eval --agents ssh --quiet id_ed25519`
eval `keychain --eval --agents gpg --quiet 3CB6EA7C55827AAD`
