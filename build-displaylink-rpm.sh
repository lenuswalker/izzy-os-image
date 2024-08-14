#!/bin/bash

rpm-ostree install rpmdevtools gcc gcc-c++ gcc-plugin-annobin libdrm libdrm-devel make \
    gnome-session-wayland-session xorg-x11-server-Xwayland python3-rpkg fedpkg webkitgtk6.0 gdm \
    webkit2gtk4 gnome-shell gnome-initial-setup

git clone https://github.com/displaylink-rpm/displaylink-rpm.git /tmp/displaylink-rpm

cd /tmp/displaylink-rpm

make main

rpm-ostree uninstall rpmdevtools gcc gcc-c++ gcc-plugin-annobin libdrm libdrm-devel make \
    gnome-session-wayland-session xorg-x11-server-Xwayland python3-rpkg fedpkg webkitgtk6.0 gdm \
    webkit2gtk4 gnome-shell gnome-initial-setup
