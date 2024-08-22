#!/usr/bin/env bash
# https://raw.githubusercontent.com/ingsme/dotfiles/master/install.sh

set -euo pipefail

if ! which curl; then
  echo "Missing curl, please install"
  exit 0
fi

if which brew; then
  echo "Homebrew already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  case $(uname -s) in
    Linux)
      eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      ;;
    Darwin)
      eval "$(/opt/homebrew/bin/brew shellenv)"
      ;;
    *)
      echo "This should not happen. Something is wrong!"
      ;;
  esac
fi

brew install chezmoi
chezmoi init --ssh --apply ingsme
