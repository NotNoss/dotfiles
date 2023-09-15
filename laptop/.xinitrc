xrandr --output "eDP-1" --mode 1920x1080

feh --bg-scale ~/Pictures/skyline.jpg

rfkill unblock wlan

/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &

picom &
dwmblocks &
exec dwm
