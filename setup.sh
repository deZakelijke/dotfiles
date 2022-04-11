#!/bin/bash

set -u

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_PROFILE=$HOME/.profile
ORIGINAL_VIMRC=$HOME/.vimrc

# Install basic packager
sudo apt update && \
sudo apt install -y \
    wget \
    curl \
    git \
    make \
    build-essential \
    tree \
    cargo \
    ripgrep \
    vim \
    neovim \
    python3 \
    python3-pip

# Create vim folders
mkdir -p ~/.vim/{autoload,colors}
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim


ln -sf "$PWD/files/bashrc" "$ORIGINAL_BASHRC"
ln -sf "$PWD/files/profile" "$ORIGINAL_PROFILE"
ln -sf "$PWD/files/vimrc" "$ORIGINAL_VIMRC"
ln -sf "$PWD/files/vimrc" "$HOME/.vim/init.vim"


# Install vim-plug and plugins
wget -O ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ "$1" != 'noplug' ]; then
    vim +PlugInstall +qall
fi

# Install python tools, linters and fixers
curl https://pyenv.run | bash
pyenv install 3.10.2 && \
    pyenv global 3.10.2
python3 -m pip install --user pipx && \
python3 -m pipx ensurepath && \
pipx install \
    poetry \
    doq \
    neovim \
    black \
    flake8
