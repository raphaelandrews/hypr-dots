# Maintenance

> Companion to `INSTALLATION.md`. Covers post-install system configuration and
> the recurring cleanup that keeps a btrfs disk from filling up.

## Why this doc exists

On a 256 GB btrfs install, the disk went to **100% full** while `du` only showed
~60 GB of real data. The cause: **snapper hourly timeline snapshots** piled up
(~1,000+ snapshots, ~130 GB) under `/.snapshots`. Snapshot space is invisible to
normal `du` for non-root users, so the disk looked emptier than it was.

The fix was to cap snapshots and add a cleanup routine.

## Snapper setup

Config lives at `/etc/snapper/configs/root` and is tracked in this repo at
`dotfiles/etc/snapper/configs/root`. It keeps:

- **3 daily** timeline snapshots
- **3 numbered** snapshots (package installs / boots)
- No hourly / weekly / monthly / yearly snapshots

```ini
TIMELINE_CREATE="yes"
TIMELINE_LIMIT_HOURLY="0"
TIMELINE_LIMIT_DAILY="3"
TIMELINE_LIMIT_WEEKLY="0"
TIMELINE_LIMIT_MONTHLY="0"
TIMELINE_LIMIT_QUARTERLY="0"
TIMELINE_LIMIT_YEARLY="0"
NUMBER_CLEANUP="yes"
NUMBER_LIMIT="3"
NUMBER_LIMIT_IMPORTANT="3"
```

### Deploy the config to a new machine

Because it's a `/etc` system file (not a user dotfile), stow alone won't place
it in `/`. Copy it manually:

```bash
sudo mkdir -p /etc/snapper/configs
sudo cp dotfiles/etc/snapper/configs/root /etc/snapper/configs/root
```

## Routine disk maintenance

Run when the disk gets tight or after big installs/updates.

### 1. Package manager caches

```bash
sudo paccache -rk1          # keep newest version of each installed package
yay -Sc --noconfirm         # AUR helper cache
npm cache clean --force     # npm cache
rm -rf ~/.bun/install       # bun cache
go clean -cache             # Go build cache
```

`pacman -Sc` (built-in) works too, but frees less. Avoid `pacman -Scc` unless
you really need the space — it wipes all cached packages.

### 2. Snapshots

```bash
sudo snapper list                         # see what's kept
sudo snapper -c root cleanup timeline     # trim to limits
sudo snapper -c root cleanup number
```

> If you see **"Config is locked"**, the automatic `snapper-cleanup.timer` is
> holding the lock. Stop the timers, clean, then start them again:
>
> ```bash
> sudo systemctl stop snapper-cleanup.timer snapper-timeline.timer snapperd
> sudo snapper -c root cleanup timeline
> sudo snapper -c root cleanup number
> sudo systemctl start snapperd snapper-timeline.timer snapper-cleanup.timer
> ```

### 3. Reclaim space (only if `df` doesn't improve after cleaning)

On a fully-allocated btrfs, freed snapshot space sometimes isn't returned to
`df` until a balance runs:

```bash
sudo btrfs filesystem balance start -dusage=50 /
```

## Reading the numbers

- `du` misses snapshots and cross-subvolume data; on btrfs it under-reports.
- `df -h /` is the ground truth for free space.
- `sudo btrfs filesystem usage /` shows the real data/metadata allocation.

After cleaning, a healthy 256 GB disk should sit around **~30% used**.
