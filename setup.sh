#!/bin/bash

apt update
apt install -y vim curl git tmux
curl https://github.com/benjamingorman/dotfiles/blob/master/.vimrc \
    --output $HOME/.vimrc
curl https://github.com/benjamingorman/dotfiles/blob/master/.tmux.conf \
    --output $HOME/.tmux.conf
