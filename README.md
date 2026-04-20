# dotfiles

This repository contains the tracked part of the local workstation configuration.

## Managed paths

- Home files: `.bashrc`, `.bash_profile`, `.gitconfig`, `.Xresources`, `.zshenv`, `.zshrc`, `.condarc`
- XDG config dirs: `zsh`, `git`, `kitty`, `tmux`, `starship`, `fastfetch`, `mpv`, `vim`, `nvim`, `hypr`, `waybar`, `rofi`, `dunst`, `wlogout`, `hyde`, `btop`

## Local-only files

- Secrets live in `~/.config/local/zsh/secrets.zsh`
- Host-only Zsh overrides can live in `~/.config/local/zsh/local.zsh`
- Zsh history lives in `~/.local/state/zsh/history`
- Zsh compdump cache lives in `~/.cache/zsh/.zcompdump`

## Apply links

Run:

```bash
~/.dotfiles/install.sh
```

The script backs up any existing live paths into `~/.local/share/dotfiles/backups/<timestamp>/` before creating symlinks.

## Notes

- This repository now reuses the original Neovim repository history and remote as the canonical `~/.dotfiles` Git repository.
- Browser, IDE, chat, and other application state directories are still intentionally left out.
