xrandr --output "eDP-1" --mode 1920x1080

feh --bg-scale ~/.config/noss/wallpapers/skyline.jpg

rfkill unblock wlan

picom &
dunst &
slstatus &
exec dwm
