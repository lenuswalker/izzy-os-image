#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
#rpm-ostree install make rpmbuild

# this would install a package from rpmfusion
# rpm-ostree install vlc

# Install package from github
#chmod +x /tmp/github-release-install.sh
#/tmp/github-release-install.sh displaylink-rpm/displaylink-rpm x86_64 fedora-40

# Install displaylink-rpm from source
chmod +x /tmp/build-displaylink-rpm.sh
/tmp/build-displaylink-rpm.sh


rpm-ostree uninstall fedora-packager rpmdevtools gcc gcc-c++ annobin-plugin-gcc libdrm libdrm-devel make \ 
    gnome-session-wayland-session xorg-x11-server-Xwayland python3-rpkg fedpkg webkitgtk6.0
#### Example for enabling a System Unit File

systemctl enable podman.socket
