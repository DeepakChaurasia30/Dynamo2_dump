#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:21746888:38f51ce68d25103687b343e0323c12fad6c4afaf; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:14646468:e85374ba7e4869d0ab787c7b571ebeb6d138206d \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:21746888:38f51ce68d25103687b343e0323c12fad6c4afaf && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
