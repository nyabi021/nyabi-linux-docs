#!/usr/bin/env zsh

set -e

echo "Starting macOS package installation..."

# 1. Check Homebrew
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed."
    echo "Please install Homebrew from https://brew.sh/"
    exit 1
fi

echo "Updating Homebrew..."
brew update

# 2. Package list
PACKAGES=(
    cmake
    fastfetch
    gh
    ninja
    node@24
    onnxruntime
    opencv
    p7zip
    ripgrep
    spdlog
    starship
    tree
)

# 3. Installation
echo "Checking and installing packages..."
for pkg in "${PACKAGES[@]}"; do
    if brew ls --versions "$pkg" > /dev/null; then
        echo "[SKIP] $pkg (already installed)"
    else
        echo "[INSTALL] $pkg"
        brew install "$pkg"
    fi
done

echo "Package installation completed."
echo "Note: node@24 is keg-only and may require manual PATH configuration."