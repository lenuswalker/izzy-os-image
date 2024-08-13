#!/bin/bash

rpm-ostree install fedora-packager rpmdevtools gcc make

git clone https://github.com/displaylink-rpm/displaylink-rpm.git /tmp/displaylink-rpm

cd /tmp/displaylink-rpm

make rawhide

cd /

rpm-ostree uninstall fedora-packager rpmdevtools gcc make
