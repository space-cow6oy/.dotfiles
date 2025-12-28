# git
sudo apt install git
ssh-keygen -t ed25519 -C "artyomvoloshenko@gmail.com" (for github and gitverse -> add public keys to them)

git clone .dotfiles (only through ssh!!!)
cp ~/.dotfiles/config ~/.ssh/ (copy because ssh keys names are different for different machines)
change path to public keys in ~/.ssh/config 
ln -s ~/.dotfiles/.gitconfig ~/ 
cd ~/.dotfiles
git remote add origin-gitverse ssh://git@gitverse.ru:2222/dam.hay/.dotfiles.git 

git remote set-url origin-gitverse ssh://git@gitverse.ru:2222/dam.hay/.dotfiles.git  


# font
cp Jetbrains... /usr/local/share/fonts/
fc-cache -fv

# firefox
install firefox with apt (guide in oficial website)

- firefox-extensions
vimium c
dark reader
simple translate


- disable alt
about:config
ui.key.menuAccessKeyFocuses to False
ui.key.menuAccessKey 18->19

- scrolling
settings -> use smooth scrolling

- startup
settings -> open previous windows and tabs

- uninstall firefox-esr
sudo apt purge firefox-esr



# gnome extensions
sudo apt install gnome-shell-extension-prefs

extensions:
Disable Workspace Switch Animation 
No overview at start-up
Forge
ln -s ~/.dotfiles/forge ~/.config  
Just Perfection
Open Bar
Auto Move Windows
Space Bar (install, turn on, check button (super+shift+workspace number), disable extension)
Rounded window corners reborn 

Pomodoro
sudo apt-get install gnome-shell-pomodoro

unnecessary extensions
Blur My Shell
Highlight Focus
Tactile



# Workspace Management
sudo apt install wmctrl

in settings custom shortcuts:
wmctrl -s 0
wmctrl -s 1
...

debian settings -> keyboard shortcuts -> super+h -> super+z

# Kitty
sudo apt install kitty

rm ~/.config/kitty 
ln -s ~/.dotfiles/kitty ~/.config/kitty/

это сделано для kitty, повторять не нужно
если тем нет, то git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.dotfiles/kitty/kitty-themes
cd ~/.dotfiles/kitty
ln -s ./kitty-themes/themes/gruvbox_dark.conf ~/.dotfiles/kitty/theme.conf



# termperature monitoring
sudo apt update && sudo apt install lm-sensors
sudo sensors-detect
watch -n 1 sensors


# zsh
vi ~/.dotfiles/zsh_man




# neovim
download tarball (tar.gz) from neovim releases github
extract to /programs
sudo ln -s ~/programs/nvim-linux-x86_64/bin/nvim /bin/

ln -s ~/.dotfiles/nvim ~/.config 

sudo apt update
sudo apt install build-essential
sudo apt install wl-clipboard
sudo apt install imagemagick curl
sudo apt install python3.13-venv
sudo apt install npm

# tmux
sudo apt install tmux
ln -s ~/.dotfiles/.tmux.conf ~/ 

git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm

перезагрузить комп


# mpv
sudo apt install mpv

ln -s ~/.dotfiles/mpv.conf ~/.config/mpv/
