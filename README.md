# Hyprland on Arch linux
![Desktop](https://github.com/smbrn07/dotfiles/blob/main/pic/desktop.png?raw=true)

# CAUTION: Please READ the Hyprland wiki FIRST. DO NOT blindly copy/paste 😏.

# Requirements
1. Arch Linux Base Install
2. yay

# NVIDIA users only
## Step 1: Installing required packages and enabling multilib

1. Update the system:
   `sudo pacman -Syu`
2. Install required packages:
   `sudo pacman -S base-devel linux-headers git nvim --needed`
3. Install the AUR helper, yay
   - `cd ~`
   - `git clone https://aur.archlinux.org/yay.git`
   - `cd yay`
   - `makepkg -si`
4. Enable multilib repository
   - `sudo nvim /etc/pacman.conf`
   - Uncomment the following lines by removing the # -character at the start them
     - **[multilib]**
     - **Include = /etc/pacman.d/mirrorlist**
     - **:wq**
5. Run `yay -Syu`, to update the system package database

## Step 2: Installing the driver packages

1. First find your [NVIDIA card from this list here](https://nouveau.freedesktop.org/CodeNames.html). Alternatively you can take a look at the [Gentoo wiki](https://wiki.gentoo.org/wiki/NVIDIA#Feature_support).
2. Check what driver packages you need to install from the table below

| Driver name                                      | Kernel                      | Base driver       | OpenGL             | OpenGL (multilib)        |
| ------------------------------------------------ | --------------------------- | ----------------- | ------------------ | ------------------------ |
| Maxwell (NV110) series and newer                 | linux or linux-lts          | nvidia            | nvidia-utils       | lib32-nvidia-utils       |
| Maxwell (NV110) series and newer                 | not linux and not linux-lts | nvidia-dkms       | nvidia-utils       | lib32-nvidia-utils       |
| Kepler (NVE0) series                             | any                         | nvidia-470xx-dkms | nvidia-470xx-utils | lib32-nvidia-470xx-utils |
| GeForce 400/500/600 series cards [NVCx and NVDx] | any                         | nvidia-390xx-dkms | nvidia-390xx-utils | lib32-nvidia-390xx-utils |
| Tesla (NV50/G80-90-GT2XX)                        | any                         | nvidia-340xx-dkms | nvidia-340xx-utils | lib32-nvidia-340xx-utils |

3. Install the correct Base driver, OpenGL, and OpenGL (multilib) packages
   - Example: `yay -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings`

## Step 3: Enabling DRM kernel mode setting

In this step please complete all the parts: _Setting the Kernel Parameter_, _Add Early Loading of NVIDIA Modules_, and _Adding the Pacman Hook_.

### Setting the Kernel Parameter:

Setting the kernel parameter depends on what bootloader you are using. Complete only one of the options below (A or B). After that, continue to _Add Early Loading of NVIDIA Modules_.

#### Option A) For GRUB users

1. Edit the GRUB configuration file:
   - `sudo nvim /etc/default/grub`
   - Find the line with **GRUB_CMDLINE_LINUX_DEFAULT**
   - Append the words inside the quotes with **nvidia_drm.modeset=1**
     - Example: **GRUB_CMDLINE_LINUX_DEFAULT="quiet splash nvidia_drm.modeset=1"**
2. Update: `sudo grub-mkconfig -o /boot/grub/grub.cfg`

#### Option B) For systemd-boot users

1. Navigate to the bootloader entries directory: `cd /boot/loader/entries/`
2. Edit the appropriate **.conf** file for your Arch Linux boot entry
   - `sudo nvim <filename>.conf`
3. Append **nvidia-drm.modeset=1** to the **options** line
4. Save the file with _CTRL+S_ and close nano with _CTRL+X_

### Add Early Loading of NVIDIA Modules:

1. Edit the **mkinitcpio** configuration file:
   - `sudo nvim /etc/mkinitcpio.conf`
   - Find the line that says **MODULES=()**
   - Update the line to: **MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)**
   - Find the line that says **HOOKS=()**
   - On the **HOOKS=()** line, find the word **kms** inside the parenthesis and remove it
2. Regenerate the initramfs `sudo mkinitcpio -P`

### Adding the Pacman Hook:

1. Get the **nvidia.hook** -file from this repository
   - `cd ~`
   - `wget https://raw.githubusercontent.com/korvahannu/arch-nvidia-drivers-installation-guide/main/nvidia.hook`
2. Open the file with your preferred editor.
   - `nvim nvidia.hook`
3. Find the line that says **Target=nvidia**.
4. Replace the word **nvidia** with the base driver you installed, e.g., **nvidia**
   - The edited line should look something like this: **Target=nvidia**
6. Move the file to **/etc/pacman.d/hooks/** with: `sudo mkdir -p /etc/pacman.d/hooks/ && sudo mv ./nvidia.hook /etc/pacman.d/hooks/`

# Pacman

```
sudo pacman -Syu neovim neofetch swaync waybar wl-clipboard wtype pavucontrol jq rofimoji adw-gtk-theme cliphist python-gobject spotify-launcher clang libnotify exa $(pacman -Ssq noto-fonts) fzf wget
```

## Yay

```
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si
```

```
yay -S nwg-look rofi-wayland apple_cursor wlogout
```
