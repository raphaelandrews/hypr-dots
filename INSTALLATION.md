# Installation

Dependencies required for this setup to work on Arch Linux.

## Package Manager

Install packages with `pacman` (official repos) or your AUR helper (e.g., `yay`).

```bash
# Official repos
sudo pacman -S <packages>

# AUR
yay -S <aur-packages>
```

## Core

| Package | Repo | Purpose |
|---------|------|---------|
| `hyprland` | official | Wayland compositor |
| `uwsm` | official | Wayland session manager |
| `xdg-desktop-portal-hyprland` | official | Screen sharing portal |
| `xdg-desktop-portal-gtk` | official | GTK portal backend |
| `qt5-wayland` `qt6-wayland` | official | Qt Wayland support |
| `polkit-gnome` | official | Authentication agent |

## Lock / Idle / Screen

| Package | Repo | Purpose |
|---------|------|---------|
| `hyprlock` | official | Lock screen |
| `hypridle` | official | Idle daemon |
| `hyprsunset` | official | Night light |

## Terminal & Shell

| Package | Repo | Purpose |
|---------|------|---------|
| `kitty` | official | Terminal emulator |
| `foot` | official | Terminal emulator |
| `alacritty` | official | Terminal emulator |
| `ghostty` | official | Terminal emulator |
| `tmux` | official | Terminal multiplexer |
| `zsh` | official | Shell |
| `oh-my-zsh-git` | AUR | Zsh framework |
| `zsh-theme-powerlevel10k` | official | Prompt theme |
| `zsh-autosuggestions` | official | Autosuggestions |
| `zsh-syntax-highlighting` | official | Syntax highlighting |

## Status Bar

| Package | Repo | Purpose |
|---------|------|---------|
| `waybar` | official | Status bar |

## Notifications

| Package | Repo | Purpose |
|---------|------|---------|
| `mako` | official | Notification daemon |
| `libnotify` | official | `notify-send` |

## Wallpaper

| Package | Repo | Purpose |
|---------|------|---------|
| `swaybg` | official | Wallpaper setter |

## Screenshot & Screen Capture

| Package | Repo | Purpose |
|---------|------|---------|
| `grim` | official | Screenshot |
| `slurp` | official | Region selector |
| `wl-clipboard` | official | Clipboard (wl-copy, wl-paste) |
| `hyprpicker` | official | Color picker |
| `satty` | AUR | Screenshot annotation |
| `tesseract` | official | OCR (text extraction) |

## App Launcher

| Package | Repo | Purpose |
|---------|------|---------|
| `walker` | AUR | App launcher / runner / clipboard manager |

## Input

| Package | Repo | Purpose |
|---------|------|---------|
| `wtype` | official | Virtual keyboard input |
| `fcitx5` `fcitx5-configtool` `fcitx5-gtk` `fcitx5-qt` | official | Input method framework |

## Audio

| Package | Repo | Purpose |
|---------|------|---------|
| `pipewire` `wireplumber` `pipewire-pulse` `pipewire-alsa` `pipewire-jack` | official | Audio server |
| `playerctl` | official | Media player control |
| `swayosd` | AUR | On-screen display (volume, brightness) |
| `pamixer` | official | PulseAudio mixer (CLI) |
| `wiremix` | AUR | PipeWire mixer (TUI) |

## Bluetooth & Network

| Package | Repo | Purpose |
|---------|------|---------|
| `bluetui` | AUR | Bluetooth manager (TUI) |
| `impala` | AUR | Network manager (TUI) |
| `networkmanager` | official | Network management |
| `brightnessctl` | official | Backlight control |

## File Manager

| Package | Repo | Purpose |
|---------|------|---------|
| `nautilus` | official | GUI file manager |
| `yazi` | official | TUI file manager |
| `fd` | official | Fast file search |
| `ripgrep` | official | Content search (rg) |
| `fzf` | official | Fuzzy finder |
| `zoxide` | official | Smart directory jump |

## Text & Code Editors

| Package | Repo | Purpose |
|---------|------|---------|
| `neovim` | official | Terminal editor |
| `code` | official | VS Code (oss) |
| `helix` | official | Terminal editor |

## Browsers (install any you use)

| Package | Repo |
|---------|------|
| `chromium` | official |
| `google-chrome` | AUR |
| `brave-bin` | AUR |
| `microsoft-edge-stable-bin` | AUR |
| `vivaldi` | official |
| `firefox` | official |
| `zen-browser-bin` | AUR |
| `librewolf-bin` | AUR |
| `helium-bin` | AUR |

## Communication

| Package | Repo | Purpose |
|---------|------|---------|
| `signal-desktop` | official | Messaging |
| `telegram-desktop` | official | Messaging |

## Password Managers

| Package | Repo | Purpose |
|---------|------|---------|
| `1password` | official | Password manager |
| `bitwarden` | official | Password manager |

## Productivity

| Package | Repo | Purpose |
|---------|------|---------|
| `obsidian` | official | Notes |
| `gnome-calculator` | official | Calculator |

## System Monitoring

| Package | Repo | Purpose |
|---------|------|---------|
| `btop` | official | Resource monitor |
| `fastfetch` | official | System info |

## Multimedia

| Package | Repo | Purpose |
|---------|------|---------|
| `mpv` | official | Media player |
| `vlc` | official | Media player |
| `celluloid` | official | Media player |
| `zathura` `zathura-pdf-mupdf` | official | PDF viewer |
| `imv` | official | Image viewer |
| `pinta` | official | Image editor |
| `obs-studio` | official | Recording / streaming |
| `kdenlive` | official | Video editor |

## Gaming

| Package | Repo | Purpose |
|---------|------|---------|
| `steam` | official | Game platform |
| `moonlight-qt` | AUR | Game streaming |
| `retroarch` | official | Emulator |

## Developer Tools

| Package | Repo | Purpose |
|---------|------|---------|
| `git` | official | Version control |
| `jq` | official | JSON processor |
| `adb` | official | Android debug bridge |
| `scrcpy` | official | Screen mirroring |
| `kdeconnect` | official | Phone integration |
| `docker` `docker-compose` | official | Containers |
| `lazydocker` | official | Docker TUI |
| `xdg-utils` | official | xdg-open, etc. |

## Other Utilities

| Package | Repo | Purpose |
|---------|------|---------|
| `localsend` | AUR | File sharing |
| `gum` | official | CLI prompts |
| `kvantum` | official | Qt theme engine |
| `exiftool` | official | EXIF metadata |
| `mediainfo` | official | Media info |

## Fonts

| Package | Repo | Purpose |
|---------|------|---------|
| `ttf-jetbrains-mono-nerd` | official | Primary monospace font |
| `ttf-cascadia-mono-nerd` | AUR | Secondary monospace font |

## One-Line Install (Official Repos)

```bash
sudo pacman -S --needed \
  hyprland uwsm xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
  qt5-wayland qt6-wayland polkit-gnome \
  hyprlock hypridle hyprsunset \
  kitty foot alacritty ghostty tmux \
  waybar mako libnotify swaybg \
  grim slurp wl-clipboard hyprpicker tesseract \
  wtype fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt \
  pipewire wireplumber pipewire-pulse pipewire-alsa pipewire-jack \
  playerctl pamixer networkmanager brightnessctl \
  nautilus yazi fd ripgrep fzf zoxide \
  neovim chromium firefox \
  signal-desktop telegram-desktop 1password bitwarden \
  obsidian gnome-calculator btop fastfetch \
  mpv vlc celluloid zathura zathura-pdf-mupdf imv pinta obs-studio kdenlive \
  steam retroarch \
  git jq adb scrcpy kdeconnect docker docker-compose lazydocker \
  xdg-utils gum kvantum exiftool mediainfo \
  ttf-jetbrains-mono-nerd
```

## One-Line Install (AUR)

```bash
yay -S --needed \
  walker satty swayosd wiremix bluetui impala \
  localsend
```
