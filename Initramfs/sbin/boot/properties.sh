/sbin/ext/busybox mount -t rootfs -o remount,rw rootfs 
mkdir -p /customkernel/property 
echo true >> /customkernel/property/customkernel.cf-root 
echo true >> /customkernel/property/customkernel.base.cf-root 
echo FD >> /customkernel/property/customkernel.name 
echo "4.1" >> /customkernel/property/customkernel.namedisplay 
echo 80 >> /customkernel/property/customkernel.version.number 
echo 4.1 >> /customkernel/property/customkernel.version.name 
echo true >> /customkernel/property/customkernel.bootani.zip 
echo true >> /customkernel/property/customkernel.bootani.bin 
echo true >> /customkernel/property/customkernel.cwm 
echo 4.0.0.2 >> /customkernel/property/customkernel.cwm.version 
/sbin/ext/busybox mount -t rootfs -o remount,ro rootfs 
