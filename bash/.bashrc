#
# ~/.bashrc
#

[[ $- == *i* ]] && source -- ~/.local/share/blesh/ble.sh --attach=none

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# bind vim keys
set -o vi

eval "$(zoxide init bash)"
eval "$(atuin init bash)"
eval "$(fzf --bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/home/estanislao_figueroa/.opencode/bin:$PATH

[[ ! ${BLE_VERSION-} ]] || ble-attach
