# Debian Fastfetch installer

A Bash script for installing the latest version of `fastfetch`.

## Features

- Removes any existing installation.
- Downloads and installs the latest version of Fastfetch.

## Prerequisites

- Debian-based Linux distribution.
- `curl` installed.
- `sudo` privileges.

## Usage

1. Clone the repository:

    ```sh
    git clone https://github.com/Gabriel-Ladzaretti/debian-fastfetch-installer.git
    cd debian-fastfetch-installer
    ```

1. Run the script with sudo:

    ```sh
    sudo ./install_fastfetch.sh [architecture]
    ```

    - Default architecture is `amd64`.
