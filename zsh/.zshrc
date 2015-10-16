setopt autocd
setopt histappend
setopt sharehistory
setopt globdots
setopt ignoreeof

autoload -U select-word-style
select-word-style bash

export PATH="$PATH:$HOME/.local/bin"

command -v eza &>/dev/null && alias ls='eza -aF' || alias ls='ls --color=auto -hAF'
command -v fd &>/dev/null && alias fd='fd --hidden --no-ignore --follow' || alias fd='find . -name'
command -v rg &>/dev/null && alias rg='rg --hidden --no-ignore --follow --smart-case'

alias ll='ls -l'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -sh'
alias vi='vim'
alias sudo='sudo '
alias py='python3'
alias ipy='ipython3'
alias mkdir='mkdir -p'
alias cp='cp -r'
alias scp='scp -r'
alias cl='clear'
alias rsync='rsync -a -v -h'

RED="%F{1}"
GREEN="%F{2}"
GREY="%F{7}"
LIGHT_BLUE="%F{14}"

if [[ -n $SSH_CLIENT ]]; then
  HOST_COLOR=$RED
else
  HOST_COLOR=$GREEN
fi

PROMPT="%B${HOST_COLOR}%n@%m ${GREY}%* %f[%~]"$'\n'"${LIGHT_BLUE}~> %b%f"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if command -v broot &>/dev/null; then
  source /Users/georgymironov/.config/broot/launcher/bash/br
fi

[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

if command -v brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi

if test -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh; then
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi


