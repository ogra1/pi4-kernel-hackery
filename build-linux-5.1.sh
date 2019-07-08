#! /bin/sh

git clone -b rpi-5.1.y --depth=1 https://github.com/raspberrypi/linux.git linux-5.1

cd linux-5.1

git apply -v ../configs-linux-5.1rpi.patch
git apply -v ../apparmor-linux-5.1rpi.patch

./scripts/kconfig/merge_config.sh arch/arm/configs/bcm2711_defconfig \
    kernel/configs/snappy/containers.config \
    kernel/configs/snappy/generic.config \
    kernel/configs/snappy/security.config \
    kernel/configs/snappy/snappy.config \
    kernel/configs/snappy/systemd.config

make -j4 zImage
make -j4 modules
make dtbs

sudo make modules_install
sudo rm /boot/*.dtb
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo rm /boot/overlays/*
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
sudo cp arch/arm/boot/zImage /boot/kernel7l.img

cd -
tar cjvf linux-5.1rpi.tar.bz2 /lib/modules/5.1.* /boot/*.dtb /boot/overlays/* /boot/kernel7l.img
