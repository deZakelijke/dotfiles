#!/bin/bash

set -u

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_PROFILE=$HOME/.profile
ORIGINAL_VIMRC=$HOME/.vimrc

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
    shellcheck

# Create vim folders
printf "\nLinking config files...\n"
mkdir -p ~/.vim/{autoload,colors}
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim


ln -sf "$PWD/files/bashrc" "$ORIGINAL_BASHRC"
ln -sf "$PWD/files/profile" "$ORIGINAL_PROFILE"
ln -sf "$PWD/files/vimrc" "$ORIGINAL_VIMRC"
ln -sf "$PWD/files/vimrc" "$HOME/.vim/init.vim"

# Download and install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Install vim-plug and plugins
printf "\n Installing vim plugins...\n"
wget -O ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim --headless +PlugInstall +qall

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
