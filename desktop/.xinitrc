xrandr --output "DP-0" --primary --mode 1920x1080
xrandr --output "DP-2" --left-of "DP-0" --mode 1920x1080
xrandr --output "DP-1-0" --above "DP-0" --mode 1920x1080
xrandr --output "HDMI-1-0" --right-of "DP-0" --mode 1920x1080

feh --bg-scale "$HOME/.config/noss/wallpapers/firewatch.png"

picom &
dunst &
slstatus &
exec dwm
