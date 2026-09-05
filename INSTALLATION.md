# Installation

These dotfiles target an **Omarchy** system (an Arch-based distribution with
Hyprland + the Quickshell shell), v4.x.

> Post-install system config and recurring cleanup (snapper / disk space): see
> [MAINTENANCE.md](MAINTENANCE.md).

## How this fits together

Omarchy already installs and manages the core desktop stack — Hyprland, the
Quickshell status bar / notifications, lock / idle / night-light, the
screen-sharing portal, and the `foot` terminal. You do **not** install those by
hand. This repository only layers your own config on top:

```
~/.config/hypr/       Hyprland (Lua) overrides
~/.config/omarchy/    Omarchy shell, themes, hooks, extensions
~/.config/kitty/      Kitty terminal
~/.config/btop/       System monitor
~/.config/fastfetch/  System info
~/.config/yazi/       TUI file manager
~/.config/nvim/       Neovim (LazyVim)
~/.config/fcitx5/     Input method framework
```

## Prerequisites

- **Omarchy** installed — verify with `omarchy version` (expect `4.x`).
- **GNU Stow** for linking the dotfiles: `omarchy pkg add stow`.

## Install the dotfiles

The dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow/).
From a clone of this repository:

```bash
# 1. Clone the repo where stow.sh expects it
git clone <this-repo> ~/Documents/projects/hypr-dots
cd ~/Documents/projects/hypr-dots

# 2. Link the files into $HOME
./stow.sh
```

`stow.sh` simply runs:

```bash
stow -d ~/Documents/projects/hypr-dots/ -t ~/ dotfiles
```

It symlinks `.config/*`, `.zshrc`, `.p10k.zsh`, `etc/`, and the rest into
`$HOME`. Re-run it after pulling updates to pick up new files.

> **If a target already exists** (e.g. Omarchy created `~/.config/kitty`
> itself), `stow` will refuse to overwrite it. Move it aside or delete it first,
> then re-run `./stow.sh`.

## Packages

Everything the configs reference should be installed with Omarchy's package
helper, which only adds missing packages. Most of the shells/TUIs below are
already present in a stock Omarchy install; the list covers what the dotfiles
actually use.

### Shell, terminal & tools

```bash
omarchy pkg add zsh zsh-autosuggestions zsh-syntax-highlighting powerlevel10k
omarchy pkg add kitty tmux zoxide fd ripgrep fzf bat eza jq
```

### Monitoring & system info

```bash
omarchy pkg add btop fastfetch
```

### Editor

```bash
omarchy pkg add neovim git lazygit
```

### File manager

```bash
omarchy pkg add yazi nautilus
```

### Containers

```bash
omarchy pkg add docker docker-compose lazydocker
```

### Input method

```bash
omarchy pkg add fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt
```

### Apps (install whichever you use)

```bash
omarchy pkg add spotify signal-desktop obsidian 1password chromium firefox
```

### AUR-only

```bash
omarchy pkg aur add localsend
```

## Post-install

- **Neovim theme** — Omarchy symlinks `~/.config/nvim/lua/plugins/theme.lua`
  to the current theme. If you keep `~/.config/nvim` as a symlink into this
  repo, recreate that link with an absolute path so it resolves:
  ```bash
  ln -sfn ~/.local/state/omarchy/current/theme/neovim.lua \
    ~/.config/nvim/lua/plugins/theme.lua
  ```
- **User services** — a clipboard notification service lives in
  `~/.config/systemd/user/`; enable it with
  `systemctl --user enable --now clipboard-notify`.
- **Snapper** — `etc/snapper/configs/root` is included; see MAINTENANCE.md.
