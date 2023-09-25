# Get the username to find the home dir
read -p "Enter your username: " user
homedir="/home/user"

# Find what device they are using
echo "Are you on Desktop or laptop?"
echo "1. Desktop"
echo "2. Laptop"

read -p "Enter 1 or 2: " deviceans

# Make the config location
mkdir -p "$homedir/.config/noss/"

# Find the hardware they are using & get dotfiles
case $deviceans in
  1)
    device="desktop"
    echo "Will this be using nvidia?"
    read -p "Select y/N: " nvidia
    case ${nvidia,,} in
      y)
        echo "continuing with nvidia"
        pacman --noconfirm -S git nvidia lib32-nvidia-utils
        git clone https://github.com/NotNoss/dotfiles.git "$homedir/.config/noss/dotfiles"
        cp "$homedir/.config/noss/dotfiles/noss.conf" /boot/loader/entries/
        cp "$homedir/.config/noss/dotfiles/initramfs-nvidia.img" /boot/
        clear
        ;;
      n)
        echo "Not continuing with nvidia"
        pacman --noconfirm -S git
        git clone https://github.com/NotNoss/dotfiles.git "$homedir/.config/noss/dotfiles"
        ;;
      *)
        echo "Not continuing with nvidia"
        pacman --noconfirm -S git
        git clone https://github.com/NotNoss/dotfiles.git "$homedir/.config/noss/dotfiles"
        ;;
    esac
    ;;
  2)
    device="laptop"
    echo "Continuing with laptop install"
    pacman --noconfirm -S git
    git clone https://github.com/NotNoss/dotfiles.git "$homedir/.config/noss/dotfiles"
    ;;
  *)
    device="laptop"
    echo "No Input Selected... Continuing with laptop install."
    pacman --noconfirm -S git
    git clone https://github.com/NotNoss/dotfiles.git "$homedir/.config/noss/dotfiles"
    ;;
esac

# Install yay
git clone https://aur.archlinux.org/yay-bin.git ~/yay-bin
cd yay-bin
makepkg -si
cd "$homedir"
rm -rf yay-bin

# Install brave
yay -S brave-bin

# install dwm
git clone https://github.com/NotNoss/dwm.git "$homedir/.config/noss/dwm"
cd "$homedir/.config/noss/dwm"
make clean install

# install st
pacman --noconfirm -S ttf-firacode-nerd
git clone https://github.com/NotNoss/st.git "$homedir/.config/noss/st"
cd "$homedir/.config/noss/st"
make clean install

# install slock
git clone https://github.com/NotNoss/slock.git "$homedir/.config/noss/slock"
cd "$homedir/.config/noss/slock"
make clean Install

# install slstatus
git clone https://github.com/NotNoss/slstatus.git "$homedir/.config/noss/slstatus"
cd "$homedir/.config/noss/slstatus"
make clean Install

# install wallpapers
git clone https://github.com/NotNoss/wallpapers.git "$homedir/.config/noss/wallpapers"

# install dunst
pacman --noconfirm -S dunst libnotify
cd "$homedir/.config"
ln -s "noss/dotfiles/$device/dunst" "./dunst"
dunst &
notify-send "Test" "This is a test notification"

# install neovim
pacman --noconfirm -S neovim clang unzip npm
ln -s "noss/dotfiles/nvim" "./nvim"

# Install rofi
pacman --noconfirm -S rofi rofi-emoji rofi-calc noto-fonts-emoji
ln -s "noss/dotfiles/$device/rofi" "./rofi"

# Install picom
yay -S picom-git
ln -s "noss/dotfiles/picom" "./picom"

# install audio
pacman --noconfirm -S pipewire pipewire-pulse wireplumber

# cd back to home directory
cd "$homedir"

# setup zsh config
ln -s "$homedir/.config/noss/dotfiles/.zshrc" "$homedir/.zshrc"

# setup xinit config
ln -s "$homedir/.config/noss/dotfiles/$device/.xinitrc" "$homedir/.xinitrc"

# clear console
clear

echo "The script has finished. Last things to do are:"
echo "systemctl --user enable --now pipewire"
echo "systemctl --user enable --now pipewire-pulse"
echo "systemctl --user enable --now wireplumber"
echo "Install zsh"
echo "startx to start the x session"
