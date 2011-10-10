#!/sbin/busybox sh
# Logging
/sbin/busybox cp /data/user.log /data/user.log.bak
/sbin/busybox rm /data/user.log
exec >>/data/user.log
exec 2>&1

# Remount rootfs rw
  /sbin/busybox mount rootfs -o remount,rw

##### Early-init phase #####

# Android Logger enable tweak
if /sbin/busybox [ "`/sbin/busybox grep ANDROIDLOGGER /system/etc/tweaks.conf`" ]; then
  insmod /lib/modules/logger.ko
fi


