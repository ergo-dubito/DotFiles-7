#!/bin/bash

# Set version to system
export PYENV_VERSION=system

# Set script directory DIR
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

if [[ ! $(brew --version) ]]; then
  echo "Install core utils from Xcode"
  xcode-select --install

  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Installing brew packages"
  brew install awscli awsebcli coreutils ctags bash bash-completion fzf git gnutls go gpg httpie hub openssl stow jq ffmpeg clojure leiningen mysql postgres imagemagick pandoc pssh pyenv pyenv-virtualenv ripgrep nodejs packer terraform youtube-dl hunspell tmux vim z

  brew install gnu-sed --with-default-names
  brew install findutils --with-default-names
  brew services start mysql
  brew services start postgres

  echo "Changing default shell to latest bash"
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
  chsh -s /usr/local/bin/bash

  echo "Tap some casks"
  brew tap caskroom/cask
  brew tap caskroom/drivers
  brew tap caskroom/versions

  echo "Installing casks"
  brew cask install docker google-chrome google-backup-and-sync iterm2 java8 karabiner-elements licecap flycut shiftit tunnelblick slack logitech-options paintbrush ngrok

  echo "Setup pyenv"
  eval "$(pyenv init -)"
  pyenv install 3.6.2
  pyenv install 3.6.5
  pyenv global 3.6.5

  echo "Installing global pips"
  pip install ipython pylint yapf vim-vint

  echo "Installing global npms"
  npm install -g prettier tern jsonlint

  echo "Stowing files"
  stow -t ~ .

  echo "Enable keyrepeat"
  defaults write -g ApplePressAndHoldEnabled -bool false
  defaults write NSGlobalDomain KeyRepeat -int 2
  defaults write NSGlobalDomain InitialKeyRepeat -int 12

else
  brew update
  brew upgrade
  brew prune
  brew cleanup
  brew doctor
  brew cask cleanup
fi

unset $PYENV_VERSION

# vim:set ft=sh et sw=2:
