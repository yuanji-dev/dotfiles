if [[ -z "${SSH_AUTH_SOCK}" ]] || [[ -z "${SSH_AGENT_PID}" ]]; then
  eval `keychain --eval --agents ssh --quiet id_ed25519`
fi
if [[ -z "${GPG_AGENT_INFO}" ]]; then
  eval `keychain --eval --agents gpg --quiet 3CB6EA7C55827AAD`
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#####################################################################
# zplug
#####################################################################

# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug romkatv/powerlevel10k, as:theme, depth:1
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-syntax-highlighting
zplug zsh-users/zsh-history-substring-search

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
export FPATH="$HOME/.zsh_completions:$FPATH"
export XDG_CONFIG_HOME=$HOME/.config

alias ls='exa'
alias ll='ls -alh'
alias cat=bat
alias sudo='sudo '
alias vi='nvim'
alias vim='nvim'
alias v='f -e nvim'
if ! command -v pbcopy &> /dev/null; then
  alias pbcopy='wl-copy'
fi
if ! command -v open &> /dev/null; then
  alias open='xdg-open'
fi

zsh_stats() {
  fc -l 1 | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n20
}

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

eval "$(fasd --init auto)"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
