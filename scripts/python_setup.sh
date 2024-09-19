#!/bin/bash

printf "\nInstalling python tools and packages...\n"
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update \
    && sudo apt install -y \
    libsqlite3-dev \
    libncurses-dev \
    libreadline-dev \
    lzma \
    liblzma-dev \
    libbz2-dev \
    python3.10 \
    python3-pip \
    python3.10-venv \
    poetry

curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.10 && \
    pyenv global 3.10

pip3 install \
    neovim \
    doq \
    pre-commit \
    pysqlite3
