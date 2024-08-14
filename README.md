# Hyprland on Arch linux

## CAUTION: Please READ the Hyprland wiki FIRST. Don't blindly copy/paste this repo.

## Hyprland is now on Arch repository!

## Requirements
1. Arch Linux Base Install
2. yay

## Pacman

```
sudo pacman -Syu tmux neovim neofetch swaync waybar xdg-user-dirs grim slurp wl-clipboard wtype pavucontrol jq qt5-wayland qt6-wayland qt5ct qt6ct rofimoji
```

## Yay

```
sudo pacman -S base-devel git
git clone https://aur.archlinux.org/yay
cd yay
makepkg -si
```

```
yay -S grimblast nwg-look rofi-wayland apple_cursor cliphist wlogout
```
