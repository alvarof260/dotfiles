#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

if [[ -z "$ZELLIJ" && -t 1 && "$PS1" && -z "$SSH_CONNECTION" ]]; then
  exec zellij
fi

eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

set -o vi

dotfiles_add() {
  local dotfiles_dir="$HOME/dotfiles"
  local base_dir="$HOME/.config"

  if [ ! -d "$dotfiles_dir" ]; then
    echo "Error: '$dotfiles_dir' no existe."
    return 1
  fi

  if [ -z "$1" ]; then
    echo "Uso: dotfiles_add <archivo(s)>"
    return 1
  fi

  for original_path in "$@"; do
    # Asegurarse de que sea ruta absoluta
    if [[ "$original_path" != /* ]]; then
      original_path="$(pwd)/$original_path"
    fi

    if [ ! -e "$original_path" ]; then
      echo "Advertencia: '$original_path' no existe."
      continue
    fi

    # Obtener ruta relativa a ~/.config
    relative_path="${original_path#$base_dir/}"

    # Ruta de destino
    target_path="$dotfiles_dir/$relative_path"

    # Crear carpeta destino si no existe
    mkdir -p "$(dirname "$target_path")"

    echo "Moviendo '$original_path' → '$target_path'"
    mv -- "$original_path" "$target_path"

    echo "Creando symlink '$original_path' → '$target_path'"
    ln -s -- "$target_path" "$original_path"
    echo "✔ Hecho: $relative_path"
    echo "----------------------------------------"
  done

  echo "Acordate de ir a ~/dotfiles y hacer commit para poder subir los cambios"
}

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
