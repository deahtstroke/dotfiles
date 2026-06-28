#!/bin/sh

DOTFILES_DIR=$HOME/dotfiles
CONFIG_DIR=$HOME/.config

if [! -d "DOTFILES_DIR" ]; then
	echo "Cloning dotfiles..."
	git clone git@github.com:deahtstroke/dotfiles.git "$DOTFILES_DIR"
fi

link() {
	local src="$DOTFILES_DIR/$1"
	local dest="$2"

	if [-e "$dest" ] && [ ! -L "$dest"]; then
		echo "Backing up $dest -> $dest.bak"
		mv "$dest" "$dest.bak"
	fi

	ln -sf "$src" "$dest"
	echo "Linked $src -> $dest"
}

link "nvim" "$CONFIG_DIR/nvim"
