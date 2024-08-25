#!/bin/sh

set -ouex pipefail


ARCH="$(rpm -E '%_arch')"
KERNEL="$(rpm -q kernel)"
RELEASE="$(rpm -E '%fedora')"
RELEASE=40

cp /tmp/akmods-addons/rpmbuild/SOURCES/negativo17-fedora-multimedia.repo /etc/yum.repos.d/

sed -i 's|baseurl=https://negativo17.org/repos/multimedia/fedora-$releasever/$basearch/|baseurl=https://negativo17.org/repos/multimedia/fedora-40/$basearch/' /etc/yum.repos.d/negativo17-fedora-multimedia.repo

### BUILD evdi (succeed or fail-fast with debug output)
export CFLAGS="-fno-pie -no-pie"
rpm-ostree install -y \
    akmod-evdi-1.14.6-2.fc40.${ARCH}
akmods --force --kernels "${KERNEL}" --kmod evdi
modinfo /usr/lib/modules/${KERNEL}/extra/evdi/evdi.ko.xz > /dev/null \
|| (find /var/cache/akmods/evdi/ -name \*.log -print -exec cat {} \; && exit 1)

rm -f /etc/yum.repos.d/negativo17-fedora-multimedia.repo
unset CFLAGS