#!/bin/bash

set -euo pipefail

# renovate: datasource=github-releases depName=fastfetch-cli/fastfetch
FASTFETCH_VERSION=2.20.0

ARCH="${1:-"amd64"}"
DOWNLOAD_URL="https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-${ARCH}.deb"
DEB_FILE="fastfetch.deb"

check_sudo() {
    if [[ $EUID -ne 0 ]]; then
        echo "Error: This script must be run with sudo"
        exit 1
    fi
}

remove_fastfetch() {
    if command -v fastfetch &>/dev/null; then
        echo "Removing fastfetch..."
        sudo apt remove fastfetch
    fi
}

install_fastfetch() {
    echo "Downloading fastfetch package from ${DOWNLOAD_URL}..."
    curl -o "${DEB_FILE}" -SL "${DOWNLOAD_URL}"

    echo "Installing fastfetch..."
    sudo apt install -y "${DEB_FILE}"
}

cleanup() {
    echo "Cleaning up temporary files..."
    rm -f "${DEB_FILE}"
}

# Main script execution
check_sudo

# Ensure cleanup runs on script exit
trap cleanup EXIT

echo "Starting fastfetch installation..."

remove_fastfetch
install_fastfetch

echo "Package installed successfully."
