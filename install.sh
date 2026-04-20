#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
BACKUP_DIR="$XDG_DATA_HOME/dotfiles/backups/$(date +%Y%m%d-%H%M%S)"

home_items=(
  .bashrc
  .bash_profile
  .gitconfig
  .Xresources
  .zshenv
  .zshrc
  .condarc
)

config_items=(
  zsh
  git
  kitty
  tmux
  starship
  fastfetch
  mpv
  vim
  nvim
  hypr
  waybar
  rofi
  dunst
  wlogout
  hyde
  btop
)

backup_and_link() {
  local source_path="$1"
  local target_path="$2"
  local backup_target=

  mkdir -p -- "$(dirname -- "$target_path")"

  if [[ -L "$target_path" ]] && [[ "$(readlink -f -- "$target_path")" == "$(readlink -f -- "$source_path")" ]]; then
    printf 'skip  %s\n' "$target_path"
    return
  fi

  if [[ -e "$target_path" ]] || [[ -L "$target_path" ]]; then
    backup_target="$BACKUP_DIR${target_path#$HOME}"
    mkdir -p -- "$(dirname -- "$backup_target")"
    mv -- "$target_path" "$backup_target"
    printf 'backup %s -> %s\n' "$target_path" "$backup_target"
  fi

  ln -sfn -- "$source_path" "$target_path"
  printf 'link  %s -> %s\n' "$target_path" "$source_path"
}

migrate_zsh_history() {
  local new_hist="$XDG_STATE_HOME/zsh/history"
  local old_hist=

  mkdir -p -- "$(dirname -- "$new_hist")"

  for old_hist in "$XDG_CONFIG_HOME/zsh/.zsh_history" "$HOME/.zsh_history"; do
    if [[ -f "$old_hist" ]] && [[ ! -f "$new_hist" ]]; then
      mv -- "$old_hist" "$new_hist"
      continue
    fi
    if [[ -f "$old_hist" ]]; then
      cat -- "$old_hist" >> "$new_hist"
      rm -f -- "$old_hist"
    fi
  done

  if [[ -f "$new_hist" ]]; then
    chmod 600 -- "$new_hist"
  fi
}

mkdir -p -- "$XDG_CONFIG_HOME/local/zsh" "$XDG_STATE_HOME/zsh" "${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
migrate_zsh_history

if [[ -f "$XDG_CONFIG_HOME/local/zsh/secrets.zsh" ]]; then
  chmod 600 -- "$XDG_CONFIG_HOME/local/zsh/secrets.zsh"
fi

for item in "${home_items[@]}"; do
  backup_and_link "$DOTFILES_DIR/home/$item" "$HOME/$item"
done

for item in "${config_items[@]}"; do
  backup_and_link "$DOTFILES_DIR/config/$item" "$XDG_CONFIG_HOME/$item"
done

printf 'done  backups stored under %s\n' "$BACKUP_DIR"
