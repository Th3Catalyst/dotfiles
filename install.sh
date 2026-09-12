#!/bin/bash

install() {
    echo "Copying dotfiles..."
    shopt -s dotglob
    cp -r ~/.dots/dots/* ~
    echo "Copying complete"
    echo "Copying hyprland config..."
    cp -r ~/.dots/hypr/* ~/.config/hypr
    echo "Copying complete"
    echo "Copying neovim config..."
    cp -r ~/.dots/nvim/* ~/.config/nvim
    echo "Copying complete"
    echo "Copying fastfetch config"
    cp ~/.dots/misc/config.jsonc ~/.config/fastfetch/config.jsonc
    cp ~/.dots/misc/logo.txt ~/.config/fastfetch/logo.txt
    echo "Copying complete"
    echo "Installing codium extensions..."
    codium --install-extension < ~/.dots/misc/extensions.txt
    echo "Install complete"
}

install
