#!/bin/bash

set -u

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_PROFILE=$HOME/.profile
ORIGINAL_VIMRC=$HOME/.vimrc

# Install basic packager
printf "Installing apt packages..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update \
    && sudo apt install -y \
    wget \
    curl \
    git \
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
    shellcheck \
    python3.9 \
    python3-pip \
    python3.9-venv

# Create vim folders
printf "\nLinking config files..."
mkdir -p ~/.vim/{autoload,colors}
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim


ln -sf "$PWD/files/bashrc" "$ORIGINAL_BASHRC"
ln -sf "$PWD/files/profile" "$ORIGINAL_PROFILE"
ln -sf "$PWD/files/vimrc" "$ORIGINAL_VIMRC"
ln -sf "$PWD/files/vimrc" "$HOME/.vim/init.vim"


# Install vim-plug and plugins
printf "\n Installing vim plugins..."
wget -O ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Has to be run twice for some reason
vim +PlugInstall +qall
sleep(5)
vim +PlugInstall +qall

# Install python tools, linters and fixers
printf "\nInstalling python tools..."
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.9.13 && \
    pyenv global 3.9.13
# Split this in separate commands
pip3 install poetry neovim doq black pylint isort
