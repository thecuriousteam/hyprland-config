# Hyprland config (end-4 + custom)

Local customizations live in `custom/` and are **not** overwritten by end-4 updates. Keep GPU, HDMI, and hypridle changes there.

This machine: Arch Linux, Alienware M16 R2 (Intel Arc + RTX 4060), Timeshift rsync on the same disk (`/timeshift`).

## Future system update

Use **paru**, not `pacman -Syu` alone. Pacman skips AUR apps and can leave a partial upgrade.

### 1. Snapshot first

```bash
sudo timeshift --list
sudo timeshift --create --comments "before arch hyprland update" --tags O --yes
sudo timeshift --list
```

Optional: remove an old on-demand snapshot after the new one exists:

```bash
sudo timeshift --delete --snapshot 'YYYY-MM-DD_HH-MM-SS' --yes
```

Snapshots are stored at `/timeshift/snapshots/`. This copy is on the same NVMe, so it rolls back a bad update, not a dead disk.

### 2. Preview, then upgrade

```bash
sudo pacman -Sy
pacman -Qu
paru -Qua
paru -Syu
```

Watch for kernel, `nvidia-open`, `nvidia-utils`, `hyprland`, and `qt6-base`. NVIDIA + kernel need a reboot.

### 3. Reboot

```bash
systemctl reboot
```

After login, confirm:

```bash
uname -r
pacman -Q linux nvidia-open nvidia-utils hyprland
hyprctl version
pgrep -a Hyprland
pgrep -a qs
```

Check HDMI, cursor on the external display, and sleep/resume.

### 4. Only if the bar/dock is missing

Quickshell may need a rebuild after a Qt change. Do **not** run this if the desktop looks fine.

```bash
cd ~/.cache/dots-hyprland && git stash && git pull && ./setup install -s
```

`-s` skips another full `pacman -Syu`. The script is interactive:

- Let Quickshell / `illogical-impulse-*` rebuild.
- Skip `rsync` steps that would overwrite configs you care about.
- Keep `~/.config/hypr/custom/`. Do **not** follow the wiki step that says to move `custom/` away — that was only for the Hyprland 0.55 Lua migration.

## Restore if the update breaks

Hyprland still works:

```bash
sudo timeshift --restore --snapshot 'YYYY-MM-DD_HH-MM-SS'
```

Desktop broken: `Ctrl+Alt+F3`, log in, run the same restore, then `systemctl reboot`.

The snapshot from 15 Sep 2026 is `2026-09-15_12-09-05` (`before arch hyprland update`).
