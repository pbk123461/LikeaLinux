#!/bin/bash

# 1. Clean up completely
mkdir -p live-build-dir
cd live-build-dir
lb clean --purge
rm -rf .build/

# 2. Configure the build with QEMU bootstrapping
lb config \
  --distribution trixie \
  -a arm64 \
  --bootstrap qemu-debootstrap \
  --bootstrap-qemu-arch arm64 \
  --bootstrap-qemu-static /usr/bin/qemu-arm64-static \
  --apt-recommends true \
  --compression zstd \
  --mirror-binary https://deb.debian.org/debian/ \
  --mirror-bootstrap https://deb.debian.org/debian/ \
  --linux-flavours "arm64" \
  --archive-areas "main contrib non-free non-free-firmware" \
  --iso-application "KazumaKiryu" \
  --iso-publisher "pbk123461" \
  --iso-volume "LIKEALINUX0" \
  --binary-images iso-hybrid \
  --system live \
  --bootappend-live "boot=live components quiet splash username=kiryulive hostname=LikeALinux" \
  --hdd-label "DojimaHQ" \
  --build-with-chroot true

# 3. Execute the build
lb build