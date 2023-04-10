#!/bin/bash

#### Check for paru ####
ISParu=/sbin/paru
if [ -f "$ISParu" ]; then 
    echo -e "paru was located, moving on.\n"
    paru -Syu
else 
    echo -e "paru was not located, please install paru. Exiting script.\n"
    exit 
fi

###Check for updates###

paru -Syu

### Check Nvidia card ####
read -n1 -rep 'Do you have an nvidia card ? (y,n)' NVD
if [[ $NVD == "Y" || $NVD == "y" ]]; then
    paru -S --noconfirm hyprland-nvidia-git
else
     paru -S --noconfirm hyprland-bin
fi
### Install all of the above pacakges ####
read -n1 -rep 'Would you like to install the packages? (y,n)' INST
if [[ $INST == "Y" || $INST == "y" ]]; then
    paru -S --noconfirm xdg-desktop-portal-hyprland-git
    check_command_status "paru -S xdg-desktop-portal-hyprland-git"
    paru -R --noconfirm swaylock waybar
    paru -S --noconfirm wlogout
    paru -S --noconfirm polkit-gnome ffmpeg neovim viewnior rofi pavucontrol thunar starship wl-clipboard wf-recorder swaybg grimblast-git ffmpegthumbnailer tumbler playerctl noise-suppression-for-voice thunar-archive-plugin kitty waybar-hyprland-git swaylock-effects sddm-git pamixer nwg-look-bin nordic-theme papirus-icon-theme dunst otf-sora ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa ttf-jetbrains-mono-nerd ttf-icomoon-feather ttf-iosevka-nerd adobe-source-code-pro-fonts ttf-amiri ttf-arabeyes-fonts ttf-qurancomplex-fonts ttf-sil-lateef ttf-sil-scheherazade
     # Clean out other portals
     
    echo -e "Cleaning out conflicting xdg portals...\n"
    paru -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk
fi

### Copy Config Files ###
read -n1 -rep 'Would you like to copy config files? (y,n)' CFG
if [[ $CFG == "Y" || $CFG == "y" ]]; then
    echo -e "Copying config files...\n"
    cp -R ./dotconfig/dunst ~/.config/
    cp -R ./dotconfig/hypr ~/.config/
    cp -R ./dotconfig/kitty ~/.config/
    cp -R ./dotconfig/pipewire ~/.config/
    cp -R ./dotconfig/rofi ~/.config/
    cp -R ./dotconfig/swaylock ~/.config/
    cp -R ./dotconfig/waybar ~/.config/
    cp -R ./dotconfig/wlogout ~/.config/
    cp -R ./dotconfig/wallpapers ~/.config/

    # Set some files as exacutable 
    chmod +x ~/.config/hypr/xdg-portal-hyprland
    chmod +x ~/.config/waybar/scripts/waybar-wttr.py
fi

### Enable SDDM Autologin ###
read -n1 -rep 'Would you like to enable SDDM autologin? (y,n)' WIFI
if [[ $WIFI == "Y" || $WIFI == "y" ]]; then
    LOC="/etc/sddm.conf"
    echo -e "The following has been added to $LOC.\n"
    echo -e "[Autologin]\nUser = $(whoami)\nSession=hyprland" | sudo tee -a $LOC
    echo -e "\n"
    echo -e "Enable SDDM service...\n"
    sudo systemctl enable sddm
    sleep 3
fi


### Script is done ###
echo -e "Script had completed.\n"
echo -e "You can start Hyprland by typing Hyprland (note the capital H).\n"
read -n1 -rep 'Would you like to start Hyprland now? (y,n)' HYP
if [[ $HYP == "Y" || $HYP == "y" ]]; then
    exec Hyprland
else
    exit
fi
