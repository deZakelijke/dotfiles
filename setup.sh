#!/bin/bash

set -u

ORIGINAL_BASHRC=$HOME/.bashrc
ORIGINAL_PROFILE=$HOME/.profile
ORIGINAL_VIMRC=$HOME/.vimrc

# Install basic packager
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt update
sudo apt install -y \
    wget \
    curl \
    git \
    make \
    libssl-dev \
    libffi-dev \
    build-essential \
    tree \
    cargo \
    ripgrep \
    vim \
    neovim \
    python3 \
    python3-pip \
    python3.8-venv

# Create vim folders
mkdir -p ~/.vim/{autoload,colors}
mkdir -p ~/.config
ln -s ~/.vim ~/.config/nvim


ln -sf "$PWD/files/bashrc" "$ORIGINAL_BASHRC"
ln -sf "$PWD/files/profile" "$ORIGINAL_PROFILE"
ln -sf "$PWD/files/vimrc" "$ORIGINAL_VIMRC"
ln -sf "$PWD/files/vimrc" "$HOME/.vim/init.vim"


# Install poetry before vim plugins

# Install vim-plug and plugins
wget -O ~/.config/nvim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

# Install python tools, linters and fixers
curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.10.2 && \
    pyenv global 3.10.2
python3 -m pip install --user pipx && \
python3 -m pipx ensurepath && \
# Split this in separate commands
pipx install neovim
pipx install poetry
pipx install doq
pipx install black
pipx install flake8
