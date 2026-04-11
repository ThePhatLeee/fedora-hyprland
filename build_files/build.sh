set -ouex pipefail

### 1. Enable the active lionheartp Hyprland COPR
dnf5 -y copr enable lionheartp/Hyprland
#Download the NordVPN repo file directly into the container build
curl -sSL -o /etc/yum.repos.d/nordvpn.repo https://repo.nordvpn.com/yum/nordvpn/fedora/x86_64/nordvpn.repo

### 2. Install the system base + Noctalia Stack
dnf5 install -y \
    sddm \
    uwsm \
    xdg-desktop-portal-hyprland \
    network-manager-applet \
    noctalia-hyprland-meta \
    hyprpolkitagent \
    hyprpaper \
    hypridle \
    hyprlock \
    hyprcursor \
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
    gpu-screen-recorder \
    nix \
    nordvpn

### 3. Disable the COPR
dnf5 -y copr disable lionheartp/Hyprland
rm /etc/yum.repos.d/nordvpn.repo

### 4. Enable System Units
systemctl enable podman.socket
systemctl enable sddm.service
systemctl enable nix-daemon.service
systemctl enable nordvpn.service
