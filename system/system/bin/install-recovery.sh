#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:21746888:50f085d81367ec0544b05eeb232c9d9ceaa8bd3a; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:14646468:de5afe3380fda5c21e1c7be2ad1c7d27191c51d3 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:21746888:50f085d81367ec0544b05eeb232c9d9ceaa8bd3a && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
