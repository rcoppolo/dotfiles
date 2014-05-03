#!/usr/bin/env bash

DOTFILES_ROOT="`pwd`"

set -e

function link_to_home {
  test -L "$HOME/.$1" || ln -s "$DOTFILES_ROOT/$1" "$HOME/.$1"
}

mkdir -p ~/.vim/{bundle,colors,syntax}

if [ ! -d "$HOME/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle
fi

link_to_home "vimrc"
link_to_home "gitconfig"
link_to_home "tmux.conf"
