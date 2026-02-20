#!/bin/bash

# Define package list
PACKAGES=(
    # System & Drivers
    ibus-hangul fastfetch github-cli

    # Development Tools
    cmake ninja go visual-studio-code-bin
    jetbrains-toolbox opencv onnxruntime

    # Applications & Utilities
    google-chrome spotify vesktop-bin ayugram-desktop-bin
    onlyoffice-bin pinta obsidian antigravity
    zsh alacritty starship ttf-jetbrains-mono-nerd
)

echo "Starting package installation..."

# 1. Bulk install base packages
yay -S --noconfirm --needed "${PACKAGES[@]}"

# 2. Install Steam with automated driver selection (AMD/Radeon)
echo "Installing Steam with automated driver selection..."
echo "11" | yay -S --noconfirm steam

echo "Package installation complete."