#!/usr/bin/env bash
set -euo pipefail

DOTFILES_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link_file() {
  local src="$DOTFILES_ROOT/$1"
  local dst="$HOME/.$1"

  if [ -L "$dst" ]; then
    echo "Skipping $dst (symlink exists)"
  elif [ -e "$dst" ]; then
    echo "Backing up $dst to $dst.backup"
    mv "$dst" "$dst.backup"
    ln -s "$src" "$dst"
    echo "Linked $dst"
  else
    ln -s "$src" "$dst"
    echo "Linked $dst"
  fi
}

# vim-plug (matches what vimrc uses)
if [ ! -f "$HOME/.vim/autoload/plug.vim" ]; then
  echo "Installing vim-plug..."
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

link_file "vimrc"
link_file "gitconfig"
link_file "tmux.conf"

echo "Done! Run :PlugInstall in vim to install plugins."
