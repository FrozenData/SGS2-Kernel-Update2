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

# Tweak cfq io scheduler
  for i in $(/sbin/busybox ls -1 /sys/block/mmc*)
  do echo "0" > $i/queue/rotational
    echo "0" > $i/queue/iostats
    echo "1" > $i/queue/iosched/group_isolation
    echo "4" > $i/queue/iosched/quantum
    echo "1" > $i/queue/iosched/low_latency
    echo "5" > $i/queue/iosched/slice_idle
    echo "2" > $i/queue/iosched/back_seek_penalty
    echo "1000000000" > $i/queue/iosched/back_seek_max
  done
  
# Miscellaneous tweaks
  echo "2000" > /proc/sys/vm/dirty_writeback_centisecs
  echo "1000" > /proc/sys/vm/dirty_expire_centisecs
  echo "0" > /proc/sys/vm/swappiness

# Ondemand CPU governor tweaks
  echo "80" > /sys/devices/system/cpu/cpufreq/ondemand/up_threshold
  echo "120000" > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate


