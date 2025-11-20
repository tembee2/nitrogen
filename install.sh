echo "Welcome to the nitrogen installer"

if ! whiptail --title "Proceed with Installation?" \
    --yesno "Would you like to proceed?" 7 50; then
    echo "Bye! :3"
    exit 1
fi
echo "Starting installation"
sleep 1
echo "Replacing fastfetch ascii"
cp configs/fastfetch/ascii.txt ~/.config/fastfetch/
sleep 0.2
echo "Replacing fastfetch config"
cp configs/fastfetch/config.jsonc ~/.config/fastfetch/
sleep 0.2
echo "Adding skin to wayland"
cp "configs/waybar/[NITROGEN] Nitrogen.css" ~/.config/waybar/style/
sleep 0.2
echo "Adding config to wayland"
cp "configs/waybar/[NITROGEN] Nitrogen" ~/.config/waybar/configs/
sleep 0.2
echo "Updating swaync config"
cp configs/swaync/config.json ~/.config/swaync/
sleep 0.2
echo "Updating swaync css"
cp configs/swaync/style.css ~/.config/swaync/
sleep 0.2
echo "Updating wlogout css"
cp configs/wlogout/style.css ~/.config/wlogout/
sleep 0.2
echo "Updating wlogout layout"
cp configs/wlogout/layout ~/.config/wlogout/
sleep 0.2
echo "Updating wlogout icons"
cp configs/wlogout/icons/lock.png ~/.config/wlogout/icons/
cp configs/wlogout/icons/power.png ~/.config/wlogout/icons/
cp configs/wlogout/icons/restart.png ~/.config/wlogout/icons/
sleep 0.2
echo "Adding wallpapers"
cp wallpapers/Warped.png ~/Pictures/wallpapers/
sleep 0.2
echo "Skin installed"
sleep 0.2


if ! whiptail --title "Install extras?" \
    --yesno "Install some extra software?" 7 50; then
    if ! whiptail --title "Restart computer?" \
    --yesno "Restarting your pc is heavily recommended" 7 50; then
    echo "Installation completed!"
    echo "Bye! :3"
    exit 1
    fi
fi

echo "Starting the install of extra apps and utilities"
sleep 1
echo "Updating system"
sudo pacman -Syu --noconfirm
echo "Installing extra software"
sudo pacman -S cmatrix flatpak ranger obsidian inkscape cowsay cmake lua python rust --noconfirm

if ! whiptail --title "Restart computer?" \
    --yesno "Restarting your pc is heavily recommended" 7 50; then
    echo "Installation completed!"
    echo "Bye! :3"
    exit 1
fi

echo "Installation completed! Restarting system."
echo "Bye!:3"
sleep 2
systemctl reboot