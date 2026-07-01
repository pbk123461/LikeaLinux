lb config \
  --distribution trixie \
  -a arm64 \
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
sudo lb build