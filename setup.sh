#!/bin/bash -ex

apt update
apt install -y vim curl git tmux
curl https://raw.githubusercontent.com/benjamingorman/dotfiles/master/.vimrc \
    --output $HOME/.tmux.conf
curl https://raw.githubusercontent.com/benjamingorman/dotfiles/master/.tmux.conf \
    --output $HOME/.vimrc
