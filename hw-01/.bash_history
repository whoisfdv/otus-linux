yum install -y wget
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.19.87.tar.xz
mv linux-4.19.87.tar.xz /usr/src/
cd /usr/src/
tar --help
tar -Jxvf linux-4.19.87.tar.xz 
ln -s linux-4.19.87/ linux
cd linux
cp /boot/config-3.10.0-957.12.2.el7.x86_64 ./.config
make oldconfig
yum intall -y gcc bison flex
make oldconfig
yum install ncurses-devel -y
make menuconfig
yum install bc elfutils-libelf-devel openssl-devel perl -y
make
make install
make modules
make modules_install
make install
vi /etc/default/grub
grub2-mkconfig -o /boot/grub2/grub.cfg
uname -r
reboot
uname -r
