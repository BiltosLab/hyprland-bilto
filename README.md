# hyprland-bilto
My hyprland dots + configuration from base arch install

![Screenshot](https://github.com/ChrisTitusTech/hyprland-titus/raw/main/hyprland-titus.png)

## Install

### Yay

Run as user NOT ROOT!

```
# Before this you need base-devel installed
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
```

### Packages

``` bash
yay -S hyprland-bin polkit-gnome ffmpeg neovim viewnior       \
rofi pavucontrol thunar starship wl-clipboard wf-recorder     \
swaybg grimblast-git ffmpegthumbnailer tumbler playerctl      \
noise-suppression-for-voice thunar-archive-plugin kitty       \
waybar-hyprland wlogout swaylock-effects sddm-git pamixer     \
nwg-look-bin nordic-theme papirus-icon-theme dunst otf-sora   \
ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font    \
ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa  \
ttf-jetbrains-mono-nerd ttf-icomoon-feather ttf-iosevka-nerd  \
adobe-source-code-pro-fonts
```

## Installation Guide

Install base arch using archinstall with minimal profile

Install these additional packages

```git nano vim xdg-user-dirs xdg-user-dirs-gtk linux-headers```

Add these for Nvidia GPUs

```nvidia-dkms nvidia-settings nvidia-utils```

Add these for AMD GPUs

```xf86-video-amdgpu mesa```

## Nvidia Guide

In ```/etc/mkinitcpio.conf```Add ```nvidia nvidia_modeset nvidia_uvm nvidia_drm``` To ```MODULES```

Run ```sudo mkinitcpio -P linux```

add these kernel parameters ```nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau```

Run ```sudo kernelstub -o "nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau"``` 

add a new line to```/etc/modprobe.d/nvidia.conf```(make it if it does not exist) and add the line```options nvidia-drm modeset=1 ```

add these to your environment variables 
```
LIBVA_DRIVER_NAME=nvidia
XDG_SESSION_TYPE=wayland
GBM_BACKEND=nvidia-drm
__GLX_VENDOR_LIBRARY_NAME=nvidia
WLR_NO_HARDWARE_CURSORS=1
```
Using ```sudo nano /etc/environment```

## Gotchas

- Recommend archinstall with Sway as desktop for base if you're having issues with minimal profile
- SDDM-GIT is required or you will run into shutdown bugs and delays
- SDDM needs to be configured for autologin (recommend using swaylock on start of script for security)
- Im new to linux,the nvidia guide is how i personally made my setup work it may not work for you!

## Work In Progress

- [ ] Customizing it to my own taste
- [ ] Help Popup with Hotkey
- [x] More Customizations for Waybar - Battery, Backlight, etc.
- [x] Auto-configuration - Long term goal
- [ ] Config for bash/zsh and couple of other things 
- [x] Nvidia Guide


## Sources used making these

- Official Hyprland Github <https://github.com/hyprwm/Hyprland>
- Linux Mobiles Hyprland dot files <https://github.com/linuxmobile/hyprland-dots>
- ChrisTitusTech's Hyprland dot files <https://github.com/ChrisTitusTech/hyprland-titus>
- JaKooLit's Youtube video for setting up nvidia on a laptop<https://www.youtube.com/@ja.koolit2819>
