-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- NVIDIA hybrid: software cursors avoid a missing pointer on HDMI.
hl.config({
    cursor = {
        no_hardware_cursors = true
    }
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "preferred",
    position = "auto",
    -- scale = 0.92
    scale = 1
})