#
# ~/.bashrc
#

[[ $- == *i* ]] && source -- ~/.local/share/blesh/ble.sh --attach=none

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# bind vim keys
set -o vi

eval "$(zoxide init bash)"
eval "$(atuin init bash)"
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

export FZF_DEFAULT_OPTS='--style minimal --height 40% --layout default --border'

export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

export FZF_TMUX_OPTS=" -p90%,70% "

source ~/scripts/fzf-git.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/home/estanislao_figueroa/.opencode/bin:$PATH

# alias
alias lg='lazygit'
alias c='clear'
alias e='exit'
# Next level of an ls ,Options:  --no-filesize --no-time --no-permissions
alias ls="eza --no-filesize --long --color=always --icons=always --no-user"

[[ ! ${BLE_VERSION-} ]] || ble-attach
