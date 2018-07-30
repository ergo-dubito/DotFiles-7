#!/bin/bash

if [[ ! $(git) ]]; then
  # all the basics
  sudo apt remove -y firefox
  sudo apt install -y build-essential cmake curl chromium-browser vim-gtk git tmux xcape redshift gnome-terminal parcellite python3-venv

  # fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

  # ripgrep
  curl -L -O https://github.com/BurntSushi/ripgrep/releases/download/0.8.1/ripgrep_0.8.1_amd64.deb
  sudo apt install ./ripgrep_0.8.1_amd64.deb
  rm ./ripgrep_0.8.1_amd64.deb

  cd Repos/DotFiles
  tic -x iTerm2/tmux-256color.terminfo
  stow -t ~ . --ignore=Library
else
  sudo apt update
  sudo apt upgrade
  sudo apt autoremove
fi

# vim:set ft=sh et sw=2:
