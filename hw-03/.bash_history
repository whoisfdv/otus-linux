lsblk 
grub2-mkconfig -o /boot/grub2/grub.cfg
cd /boot ; for i in `ls initramfs-*img`; do dracut -v $i `echo $i|sed "s/initramfs-//g; s/.img//g"` --force; done
man dracut 
dracut  --help
grep rd.lvm.lv /boot/grub2/grub.cfg
vi /boot/grub2/grub.cfg
reboot 
exit
history 
man grub2-mkconfig
grub2-mkconfig --help
grub2-mkconfig -o /boot/grub2/grub.cfg 
cd /boot ; for i in `ls initramfs-*img`; do dracut -v $i `echo $i|sed "s/initramfs-//g; s/.img//g"` --force; done
pvcreate /dev/sdc /dev/sdd
vgcreate vg_var /dev/sdc /dev/sdd
lvcreate --help
lvcreate -L 950M -m1 -n lv_var vg_var
lvdisplay 
lsblk 
man lvcreate
mkfs.ext4 /dev/vg_var/lv_var 
mount /dev/vg_var/lv_var /mnt/
cp -aR /var/* /mnt/
mkdir /tmp/oldvar && mv /var/* /tmp/oldvar
umount /mnt/
mount /dev/vg_var/lv_var /var/
blkid 
echo "`blkid | grep var: | awk '{print $2}'` /var ext4 defaults 0 0" >> /etc/fstab
cat /etc/fstab 
exit
lvremove /dev/vg_root/lv_root && vgremove vg_root && pvremove /dev/sdb 
lvcreate -n LogVol_Home -L 2G VolGroup00 
mkfs.xfs /dev/VolGroup00/LogVol_Home 
mount /dev/VolGroup00/LogVol_Home /mnt/
man cp
cp --help
cp -aR /home/* /mnt/
rm -rf /home/*
umount /mnt/
mount /dev/VolGroup00/LogVol_Home /home/
echo "`blkid | grep Home | awk '{print $2}'` /home xfs defaults 0 0" >> /etc/fstab
history 
umount /home/
mount /dev/VolGroup00/LogVol_Home /mnt/
umount /mnt/ && mount /dev/VolGroup00/LogVol_Home /home/
touch /home/file{1..20}
lvcreate --help
lvcreate -L 100MB -s -n home_snap /dev/VolGroup00/LogVol_Home
lvdisplay home_snap
lvdisplay
lsblk 
rm -r-f /home/file{1..20}
rm -f /home/file{1..20}
umount /home/
lvconvert --merge /dev/VolGroup00/home_snap 
lsblk 
mount /home/
ls /home/
df -h /home/
history 
cp .bash_history /home/vagrant/.bash_history_root
head -1 .ssh/authorized_keys >> /root/.ssh/authorized_keys 
cat /root/.ssh/authorized_keys 
