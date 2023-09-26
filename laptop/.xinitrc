xrandr --output "eDP-1" --mode 1920x1080

feh --bg-scale ~/.config/noss/dotfiles/wallpapers/gengar.jpg

rfkill unblock wlan

picom &
dunst &
slstatus &
exec dwm
