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
    libbz2-dev 

curl -LsSf https://astral.sh/uv/install.sh | sh
uv python install 3.10 --default

uv pip install --system \
    neovim \
    pre-commit \
    pysqlite3
