-- Alienware M16 R2 hybrid GPU
-- Intel Arc (laptop eDP-1) is primary; RTX 4060 is included so HDMI-A-1 works.
-- DRM names come from custom/udev/99-gpu-dev-path.rules
-- Install system pieces once: custom/scripts/install-hybrid-gpu.sh then reboot.
-- Hyprland: https://wiki.hypr.land/Nvidia/ and Multi-GPU wiki.
-- These env vars apply only after a Hyprland restart (logout), and NVIDIA needs a reboot.

hl.env("AQ_DRM_DEVICES", "/dev/dri/intel-igpu:/dev/dri/nvidia-dgpu")
hl.env("AQ_FORCE_LINEAR_BLIT", "0")

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
