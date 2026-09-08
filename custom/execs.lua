-- This file will not be overwritten across dots-hyprland updates.
-- The file name is for the sake of organization and does not matter
-- See the corresponding files in ~/.config/hypr/hyprland for examples

-- end4 starts `hypridle` from hyprland/execs.lua, which reads
-- ~/.config/hypr/hypridle.conf (replaced on dots update).
-- Re-launch with the update-safe copy: custom/hypridle.conf
hl.on("hyprland.start", function()
    local conf = os.getenv("HOME") .. "/.config/hypr/custom/hypridle.conf"
    hl.exec_cmd("killall hypridle; hypridle -c \"" .. conf .. "\"")
end)
