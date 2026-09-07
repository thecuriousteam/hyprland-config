#!/usr/bin/env bash
# Alienware M16 R2 hybrid GPU — system half of the Hyprland setup.
# Source of truth for the udev rule: ~/.config/hypr/custom/udev/99-gpu-dev-path.rules
# Run once: ~/.config/hypr/custom/scripts/install-hybrid-gpu.sh
# Then reboot.

set -euo pipefail

REPO="${HOME}/.config/hypr"
UDEV_SRC="${REPO}/custom/udev/99-gpu-dev-path.rules"
UDEV_DST="/etc/udev/rules.d/99-gpu-dev-path.rules"

if [[ ! -f "${UDEV_SRC}" ]]; then
    echo "Missing ${UDEV_SRC}" >&2
    exit 1
fi

sudo cp "${UDEV_SRC}" "${UDEV_DST}"
sudo udevadm control --reload
sudo udevadm trigger || true

if grep -q '^MODULES=()$' /etc/mkinitcpio.conf; then
    sudo sed -i 's/^MODULES=()$/MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)/' /etc/mkinitcpio.conf
elif grep -q '^MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm)$' /etc/mkinitcpio.conf; then
    echo "mkinitcpio MODULES already set"
else
    echo "mkinitcpio MODULES is not empty; add i915 then nvidia nvidia_modeset nvidia_uvm nvidia_drm yourself:" >&2
    grep '^MODULES=' /etc/mkinitcpio.conf >&2
    exit 1
fi

sudo pacman -S --needed nvidia-open nvidia-utils
sudo mkinitcpio -P

echo
echo "Installed. Next:"
echo "  1. reboot"
echo "  2. confirm: cat /sys/module/nvidia_drm/parameters/modeset   (must be Y)"
echo "  3. confirm: ls -l /dev/dri/intel-igpu /dev/dri/nvidia-dgpu"
echo "  4. lspci -k -d 10de:   (driver should be nvidia, not nouveau)"
