# Main palette
| Color     | Code   |
| --------  | -------|
|background | #282A2E| (B3 for dim)
|foreground | #D8DEE9|
|accent     | #C2A87B|
|accent2    | #A89065|
|accent3    | #919F75|
|success    | #6a7652|
|muted      | #717782|
|alert      | #A35D5D|

## More colors

#B7BE8A
#CAE691
#B5CB84
#AAB98C
#9FB473

## Requirements 
### Graphical environment 
- Display manager 
	1.  ly - https://github.com/fairyglade/ly
- Window manager and compositor 
	1. swaywm - https://github.com/swaywm/sway/wiki
    2. xwayland (x native apps support)
- Personalization (Bar, wallpaper, fonts)
	1. waybar - https://github.com/Alexays/Waybar
	2. sway-output (included by swaywm), swaybg 
	3. FiraCode Nerd Font & JetBrainsMono Nerd Font - https://www.nerdfonts.com
- Screen lock 
	1. swaylock-effects - https://github.com/mortie/swaylock-effects
- App launcher
	1. rofi-wayland - https://github.com/davatorium/rofi

### Functionality and drivers 
- Dual booting 
	1. Systemd-boot - https://wiki.archlinux.org/title/Systemd-boot
- Power settings 
	1. power-profiles-daemon - https://wiki.archlinux.org/title/CPU_frequency_scaling#power-profiles-daemon
	2. powerprofilesctl
- Asus control (fans, leds)
	1. asusctl - https://asus-linux.org/guides/arch-guide/
- Graphics management 
	1. Disable dGPU drivers
```
/etc/modprobe.d/blacklist-nouveau.conf

blacklist nouveau
options nouveau modeset=0
```
	https://wiki.archlinux.org/title/Hybrid_graphics
- Audio control + media manager 
	1. pipewire + wireplumber - https://wiki.archlinux.org/title/PipeWire#Audio_post-processing
	2. playerctl - https://github.com/altdesktop/playerctl
- Bluetooth 
	1. bluez - https://wiki.archlinux.org/title/Bluetooth#Installation 
	2. bluetui - https://github.com/pythops/bluetui
- Network managing 
	1. Network manager - https://wiki.archlinux.org/title/NetworkManager (dns resolving + wifi + ethernet)
- Brightness 
    1. gammastep - https://gitlab.com/chinstrap/gammastep
    2. brightnessctl - https://github.com/Hummer12007/brightnessctl

### Productivity
- Code editor and terminal emulator 
	1. neovim - https://github.com/jaosito1/nvim (own config)
	2. kitty - https://sw.kovidgoyal.net/kitty/ 
- Tools (Git, fuzzyf, rg),
	1. git 
	2. fzf, rp, tmux, tree, ripgrep
- Notetaking and pdf reader, docx & ppt editor
	1. obsidian, glow  --> .md  - https://github.com/charmbracelet/glow 
	2. libreoffice  
	3. zathura
- File -  
	1. nnn  - https://github.com/jarun/nnn
- Managing ntfs files and cloud storage 
	1. ntfs-3g - https://wiki.archlinux.org/title/NTFS
	2. onedrivecli - https://github.com/abraunegg/onedrive 

## Essential tools
- Notifications 
	1. dunst - https://github.com/dunst-project/dunst
- User dirs 
    1. xdg-user-dirs - https://wiki.archlinux.org/title/XDG_user_directories
``` shell
~/.config/user-dirs.dirs

XDG_DESKTOP_DIR="$HOME/desktop"
XDG_DOCUMENTS_DIR="$HOME/documents"
XDG_DOWNLOAD_DIR="$HOME/downloads"
XDG_MUSIC_DIR="$HOME/music"
XDG_PICTURES_DIR="$HOME/pictures"
XDG_PUBLICSHARE_DIR="$HOME/public"
XDG_TEMPLATES_DIR="$HOME/templates"
XDG_VIDEOS_DIR="$HOME/videos"
```
- Images
	1. imv (image viewer) - https://sr.ht/~exec64/imv/
	2. grim + slurp - https://sr.ht/~emersion/grim/ & https://github.com/emersion/slurp
- Clipboard manager 
	1. wl-clipboard - https://github.com/bugaevc/wl-clipboard
	2. cliphist - https://github.com/sentriz/cliphist
- Ability to manage different keyboard layouts and change between them (FR, EN, ES)
	1. sway-output - https://wiki.archlinux.org/title/Sway#Keymap
