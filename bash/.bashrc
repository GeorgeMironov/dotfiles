shopt -s histappend
shopt -s cdspell dirspell autocd
shopt -s no_empty_cmd_completion

set -o ignoreeof

export HISTCONTROL=ignoreboth:erasedups
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

export EDITOR=vim

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude ".git"'

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

HISTSIZE=10000000
HISTFILESIZE=20000000

if [[ $- == *i* ]]; then
    BOLD="\[$(tput bold)\]"
    RED="\[$(tput setaf 1)\]"
    GREEN="\[$(tput setaf 2)\]"
    GREY="\[$(tput setaf 7)\]"
    LIGHT_BLUE="\[$(tput setaf 14)\]"
    RESET="\[$(tput sgr0)\]"
fi

if [[ -n $SSH_CLIENT ]]; then
    export DISPLAY=:10
    HOST_COLOR=$RED
else
    HOST_COLOR=$GREEN
fi

PS1="${BOLD}${HOST_COLOR}\u@\h ${GREY}\D{%T} ${RESET}${BOLD}[\w]${GREY}\$(__git_ps1)${LIGHT_BLUE}\n#${RESET} "

alias ll='ls --color=auto -AlohF'
alias grep='grep --color=auto'
alias df='df -h -x"squashfs"'
alias du='du -sh'
alias vi='vim'
alias sudo='sudo '
alias py='python'
alias ipy='ipython'
alias o='xdg-open'
alias mkdir='mkdir -p'
alias cp='cp -r'
alias scp='scp -r'
alias cl='clear'

if hash subl 2>/dev/null ; then
    alias s='subl'
fi
if hash subl3 2>/dev/null ; then
    alias s='subl3'
fi

if [ -f "$HOME/.spbashrc" ]; then
    . $HOME/.spbashrc
fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

BR=$HOME/.config/broot/launcher/bash/br
[ -f $BR ] && source $BR

