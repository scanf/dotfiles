#!/bin/sh

src=https://github.com/scanf/dotfiles/
dst=/tmp/dotfiles

apt-get install -y git ruby make
git clone $src $dst
cd $dst
make