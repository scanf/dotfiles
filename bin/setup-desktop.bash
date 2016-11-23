#!/bin/bash

CONFIG_FILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";

install_program() {
  GITHUB_USER=$1
  GITHUB_PROJECT=$2
  EXPECTED_PATH=$GITHUB_ROOT/$GITHUB_USER/$GITHUB_PROJECT
  echo Will be installing $GITHUB_PROJECT
  cd $EXPECTED_PATH
  autoreconf -i
  ./configure
  $S make -j install
  cd -
}

main() {
  S=/usr/bin/sudo
  GITHUB_ROOT=$HOME/src/github.com

  install_program mortehu cantera-wm
  install_program mortehu cantera-term
  install_program mortehu cantera-lock

  $S modprobe -rvf psmouse
}

main $1

# X11

cp $CONFIG_FILES_DIR/X/xbindkeysrc $HOME/.xbindkeysrc
cp $CONFIG_FILES_DIR/X/xsession $HOME/.xsession
cp $CONFIG_FILES_DIR/X/Xdefaults $HOME/.Xdefaults
cp $CONFIG_FILES_DIR/X/Xmodmap $HOME/.Xmodmap
cp $CONFIG_FILES_DIR/X/Xresources $HOME/.Xresources
