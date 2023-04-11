# hyprland-bilto
My hyprland dots + configuration from base arch install

![Screenshot](https://github.com/Biltosgit/hyprland-bilto/blob/main/screenshot.png)

## Installation Guide


Install base arch using archinstall with minimal profile

Install these additional packages

```git nano vim xdg-user-dirs xdg-user-dirs-gtk linux-headers```

Add these for Nvidia GPUs

```nvidia-dkms nvidia-settings nvidia-utils```

Add these for AMD GPUs

```xf86-video-amdgpu mesa```

## AUR Helper

### Yay
Run as user NOT ROOT!

```
pacman -S --needed base-devel
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
```
### Paru

```
pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru-bin
cd paru
makepkg -si
```

## Clone


```bash
git clone https://github.com/Biltosgit/hyprland-bilto
cd hyprland-bilto
./set-hyprYay.sh #Use set-hyprParu.sh if you're using paru
```

## Nvidia Guide

In ```/etc/mkinitcpio.conf```Add ```nvidia nvidia_modeset nvidia_uvm nvidia_drm``` To ```MODULES```

Run ```sudo mkinitcpio -P linux```

Edit ```/boot/loader/entries/arch.conf``` and add the kernel parameters to the options line(Assuming you have Systemd-boot, for grub refer to the **[arch wiki](https://wiki.archlinux.org/title/kernel_parameters)**):

```nvidia_drm.modeset=1 rd.driver.blacklist=nouveau modprob.blacklist=nouveau```

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

## Notes/Warnings

- If archinstall with minimal profile doesnt work for you i recommend trying Desktop with Sway as base.
- SDDM needs to be configured for autologin (recommend using swaylock on start of script for security)
- Im new to linux, the nvidia guide is how i personally made my setup work it might have some unnecessary or missing stuff and it may not work for you  

## Work In Progress

- [ ] Customizing it to my own taste
- [ ] Help Popup with Hotkey
- [x] More Customizations for Waybar - Battery, Backlight, etc.
- [x] Auto-configuration - Long term goal
- [ ] Config for bash/zsh and couple of other things 
- [x] Nvidia Guide


## Sources used making these

- Official Hyprland Github <https://github.com/hyprwm/Hyprland>
- Linux Mobile's Hyprland dot files <https://github.com/linuxmobile/hyprland-dots>
- ChrisTitusTech's Hyprland dot files <https://github.com/ChrisTitusTech/hyprland-titus>
- JaKooLit's Youtube video for setting up Nvidia and Hyprland on a laptop <https://www.youtube.com/@ja.koolit2819>
