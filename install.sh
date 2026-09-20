#!/bin/sh
set -eu

DOTFILES_DIR=$HOME/dotfiles
CONFIG_DIR=$HOME/.config

if [ ! -d "DOTFILES_DIR" ]; then
	echo "Cloning dotfiles..."
	git clone https://github.com/deahtstroke/dotfiles.git "$DOTFILES_DIR"
fi

link() {
	src="$DOTFILES_DIR/$1"
	dest="$2"

	if [ -e "$dest" ] && [ ! -L "$dest" ]; then
		echo "Backing up $dest -> $dest.bak"
		mv "$dest" "$dest.bak"
	fi

	ln -sf "$src" "$dest"
	echo "Linked $src -> $dest"
}

link "nvim" "$CONFIG_DIR/nvim"

. "$DOTFILES_DIR/lib/detect.sh"

detect_os

update_index() {
	case "$PKG_MANAGER" in
		apk) apk update ;;
		apt) apt-get update -y ;;
		dnf) dnf makecache -y ;;
		yum) yum makecache -y ;;
		pacman) pacman -Sy --noconfirm ;;
		brew) brew update ;;
		none) echo "No package manager found, skipping index update"
	esac
}
