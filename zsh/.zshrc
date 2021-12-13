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
HISTSIZE=1000
SAVEHIST=1000000
setopt EXTENDED_HISTORY

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:processes' command "ps -u $USER -o pid,stat,%cpu,%mem,cputime,command"

bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


#####################################################################
# common
#####################################################################

export EDITOR=nvim
export TERM=xterm-256color
export BROWSER=google-chrome-stable
export GOPATH=$HOME/.go
export PATH=$PATH:$HOME/.local/bin:$GOPATH/bin
export XDG_CONFIG_HOME=$HOME/.config

alias ls='exa'
alias ll='ls -alh'
alias cat=bat
alias sudo='sudo '
alias vim='nvim'
alias v='f -e nvim'
if ! command -v pbcopy &> /dev/null; then
  alias pbcopy='wl-copy'
fi
if ! command -v open &> /dev/null; then
  alias open='xdg-open'
fi

function zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

eval `keychain --eval --agents ssh --quiet id_ed25519`
eval `keychain --eval --agents gpg --quiet 3CB6EA7C55827AAD`

eval "$(fasd --init auto)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
