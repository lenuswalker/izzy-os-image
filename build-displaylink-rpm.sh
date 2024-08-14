#!/bin/bash

rpm-ostree install fedora-packager rpmdevtools gcc gcc-c++ gcc-plugin-annobin libdrm libdrm-devel make xorg-x11-server-Xwayland python3-rpkg

git clone https://github.com/displaylink-rpm/displaylink-rpm.git /tmp/displaylink-rpm

cd /tmp/displaylink-rpm

make main

#rpm-ostree uninstall fedora-packager rpmdevtools gcc gcc-c++ libdrm libdrm-devel make
