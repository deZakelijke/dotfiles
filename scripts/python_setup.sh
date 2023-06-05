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
    python3.9 \
    python3-pip \
    python3.9-venv \
    poetry

curl https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install 3.9.13 && \
    pyenv global 3.9.13

pip3 install \
    neovim \
    doq \
    black \
    pylint \
    isort \
    pre-commit \
    pysqlite3 \
    gnureadline
