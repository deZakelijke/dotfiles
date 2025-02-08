#!/bin/bash

set -u

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_PROFILE=$HOME/.profile

# Install basic packager
printf "\nInstalling apt packages...\n"
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update \
    && sudo apt install -y \
    wget \
    curl \
    git \
    htop \
    make \
    libssl-dev \
    libffi-dev \
    build-essential \
    zlib1g-dev \
    llvm \
    tree \
    cargo \
    ripgrep \
    vim \
    neovim \
    powerline \
    fonts-powerline

# Create vim folders
printf "\nLinking config files...\n"
mkdir -p ~/.config
mkdir -p ~/.local/bin

# Install CommitMono Nerd Font
printf "\nInstalling CommitMono Nerd Font...\n"
curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/CommitMono.zip -o CommitMono.zip
sudo unzip CommitMono.zip -d /usr/share/fonts
fc-cache -f -v
rm CommitMono.zip
sudo rm /usr/share/fonts/README.md
sudo rm /usr/share/fonts/LICENSE

ln -sf "$PWD/files/bashrc" "$ORIGINAL_BASHRC"
ln -sf "$PWD/files/profile" "$ORIGINAL_PROFILE"

# Install Kitty
printf "\nInstalling kitty...\n"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Icon=kitty|Icon=$(readlink -f ~)/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' > ~/.config/xdg-terminals.list
# Create a sybolic link to the kitty config directory in this repo
ln -s "${PWD}/files/kitty" ~/.config

# Download and install lazygit
printf "\nInstalling lazygit...\n"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Install npm and node
printf "\nInstalling npm and node...\n"
sudo apt install -y npm
sudo npm install -g n

# Copy neovim config
printf "\nCopying neovim config...\n"
git clone https://github.com/deZakelijke/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# Read --with arguments
while [ $# -gt 0 ] ; do
    case $1 in
        -w | --with) WITH+=("$2") ;;
    esac
    shift
done

# Execute additionally passed setups
for FILE in "${WITH[@]}"; do
    if [ -f "./scripts/${FILE}_setup.sh" ]; then
        "./scripts/${FILE}_setup.sh"
    else
        echo "The file ./${FILE}_setup.sh does not exist. Skipping"
    fi
done
