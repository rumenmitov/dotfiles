#!/bin/bash

# General
cd
mkdir ~/.config
mkdir ~/Pictures

# Installing packages
sudo pacman -S --noconfirm alacritty gvim qutebrowser firefox
sudo pacman -S --noconfirm thunar sxiv gvfs tumbler ripgrep bat
sudo pacman -S --noconfirm lxappearance
sudo pacman -S --noconfirm neofetch
sudo pacman -S --noconfirm fortune-mod
sudo pacman -S --noconfirm fish
sudo pacman -S --noconfirm picom rofi feh polybar dunst maim
sudo pacman -S --noconfirm rofimoji xsel xdotool xclip emoji-font nerd-fonts
sudo pacman -S --noconfirm accountsservice
sudo pacman -S --noconfirm lightdm-webkit2-greeter
sudo pacman -S --noconfirm --needed base-devel
sudo pacman -S --noconfirm cmake python npm prettier podman podman-compose
npm install -g --noconfirm npm@latest
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install 19

# Setup neovim
echo "Setting up neovim..."
cp -r dotfiles/nvim ~/.config
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo "Neovim complete!"

# Setup paru + clipboard manager + brave
echo "Setting up paru + clipboard manager + brave + rm-improved..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
paru rofi-greenclip
paru brave-bin
paru rm-improved
paru logo-ls
cd
echo "Paru + clipboard manager + brave complete!"

# Setup misc
echo "Setting up misc..."
cp -r dotfiles/misc/fonts ~/.fonts
cp -r dotfiles/misc/images/wallpapers ~/Pictures
cp dotfiles/misc/bashrc ~/.bashrc
wget "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
cp dotfiles/misc/gitconfig ~/.gitconfig
sudo cp dotfiles/misc/git_commit.sh /usr/local/bin/commit
sudo chmod +x /usr/local/bin/commit
cp dotfiles/misc/other/tsconfig.json ~/tsconfig.json
cp dotfiles/misc/other/prettierrc.json ~/.prettierrc.json
echo "Misc complete!"

# Setup alacritty
echo "Setting up alacritty..."
cp -r dotfiles/alacritty ~/.config
echo "Alacritty complete!"

# Setup picom
echo "Setting up picom..."
cp -r dotfiles/picom ~/.config/picom
echo "Picom complete!"

# Setup i3
echo "Setting up i3..."
cp -r dotfiles/i3 ~/.config/i3
chmod +x ~/.config/i3/bar.sh
chmod +x ~/.config/i3/battery.sh
sudo rm -r ~/.config/rofi
cp -r dotfiles/rofi ~/.config/rofi
echo "i3 complete!"

# Setup polybar
echo "Setting up polybar..."
cp dotfiles/polybar/config.ini ~/.config/polybar/config.ini
cp dotfiles/polybar/wifi.sh ~/.config/polybar/wifi.sh
cp dotfiles/polybar/wifi-click.sh ~/.config/polybar/wifi-click.sh
cp dotfiles/polybar/wifi-click-alt.sh ~/.config/polybar/wifi-click-alt.sh
sudo chmod +x ~/.config/polybar/wifi.sh 
sudo chmod +x ~/.config/polybar/wifi-click.sh 
sudo chmod +x ~/.config/polybar/wifi-click-alt.sh 
echo "Polybar complete!"

# Setup lightdm
echo "Setting up lightdm..."
cd /usr/share/lightdm-webkit/themes/ 
paru lightdm-webkit-theme-osmos
cd
sudo cp dotfiles/misc/images/user.png /var/lib/AccountsService/icons/$USER.png
sudo cp dotfiles/lightdm/user.txt /var/lib/AccountsService/users/$USER
sudo chmod 644 /var/lib/AccountsService/users/$USER
sudo chmod 644 /var/lib/AccountsService/icons/$USER.png
sudo rm -r /etc/lightdm/lightdm.conf
sudo rm -r /etc/lightdm/lightdm-webkit2-greeter.conf
sudo cp dotfiles/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo cp dotfiles/lightdm/lightdm-webkit2-greeter.conf /etc/lightdm/lightdm-webkit2-greeter.conf
echo "Lightdm complete!"

# Setup fish
echo "Setting up fish..."
sudo cp -r dotfiles/fish ~/.config
echo "Fish complete!"

# Setup qutebrowser
echo "Setting up qutebrowser..."
mkdir ~/.config/qutebrowser 
sudo cp -r dotfiles/qutebrowser/themes ~/.config/qutebrowser/
sudo cp dotfiles/qutebrowser/config.py ~/.config/qutebrowser/
echo "Qutebrowser complete!"

echo "Setup complete! 🥳"
echo "Here are some other tweaks that can be made at the user's discretion:"
echo "    → Change shell to fish: sudo usermod -s /usr/bin/fish $USER"
echo "    → To install neovim plugins, open neovim and type: ':PackerSync'\n"
echo "    → Firefox config can be found in the 'firefox' directory.\n
            They can be copied to your firefox profile config.\n
            If you don't know where your profile's config is located search 'about:profiles' on firefox and click on the 'Root Directory'"
echo "    → If firefox theme is not working check out this repo:\n
            https://github.com/CristianDragos/FirefoxThemes/tree/master/Simplify%20Silver%20Peach"
echo "    → When making custom commands, make sure to use the '/usr/local/bin directory"
