#/bin/sh

yay -S hyprland eww-wayland ttf-ubuntu-nerd socat jq acpi inotify-tools\
  bluez pavucontrol brightnessctl playerctl nm-connection-editor imagemagick \
  gjs gnome-bluetooth-3.0 upower networkmanager gtk3 \
  wl-gammactl wlsunset wl-clipboard hyprpicker hyprshot blueberry \
  polkit-gnome

git clone -b eww --single-branch https://github.com/Aylur/dotfiles.git

cp -r dotfiles/.config/eww ~/.config/eww
cp -r dotfiles/.config/hypr ~/.config/hypr

mv ~/.config/hypr/_hyprland.conf ~/.config/hypr/hyprland.conf

