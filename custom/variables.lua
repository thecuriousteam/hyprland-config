-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- Super+X → Kate (nvim/Cursor only if Kate is missing).
textEditor = "~/.config/hypr/hyprland/scripts/launch_first_available.sh 'kate' 'gnome-text-editor' 'emacs' 'command -v nvim && kitty -1 nvim' 'cursor'"

-- Ctrl+Shift+Esc → Plasma System Monitor (htop only if that package is missing).
taskManager = "~/.config/hypr/hyprland/scripts/launch_first_available.sh 'plasma-systemmonitor --page-name Processes' 'gnome-system-monitor' 'command -v htop && kitty -1 htop' 'command -v btop && kitty -1 fish -c btop'"
