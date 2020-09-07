#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:21746888:dbf1fd4000e4d82fdeaf0a7f75120e2d2bbaaf75; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:14646468:8f7d28b9c9cacd12cda11741cf367688b8afb490 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:21746888:dbf1fd4000e4d82fdeaf0a7f75120e2d2bbaaf75 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
