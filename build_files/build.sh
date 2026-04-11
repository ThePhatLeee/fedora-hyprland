#!/bin/bash

set -ouex pipefail

### 1. Enable the active lionheartp Hyprland COPR
dnf5 -y copr enable lionheartp/Hyprland

### 2. Install the absolute bare minimum
# sddm: So you can actually log in
# noctalia-hyprland-meta: The entire Wayland/Hyprland core ecosystem
# kitty: Your lifeline to install Nix tomorrow
RUN dnf5 install -y \
    hyprland \
    noctalia-hyprland-meta \
    noctalia-shell \
    noctalia-qs \
    matugen \
    uwsm \
    xdg-desktop-portal-hyprland \
    hyprcursor \
    hyprpolkitagent \
    hypridle \
    hyprlock \
    hyprpaper \
    cliphist \
    hyprqt6engine \
    hyprland-qt-support \
    qt6ct \
    nwg-look \
    waypaper \
    hyprlauncher \
    hyprshot \
    hyprpicker \
    hyprsunset \
    hyprsysteminfo \
    hyprpwcenter \
    hyprshutdown \
    gpu-screen-recorder
### 3. Disable the COPR
dnf5 -y copr disable lionheartp/Hyprland

### 4. Enable SDDM
systemctl enable sddm.service
