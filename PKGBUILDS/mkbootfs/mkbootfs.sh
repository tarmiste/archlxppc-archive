#!/bin/bash

TARGET_DIR=$(pwd)
EXTRA_PACKAGES="pacman openssh irssi links pmac-utils hfsutils mac-fdisk dosfstools wireless_tools wpa_supplicant dialog"
SUPEF_PACKAGES=""
KERNEL_VERSION="2.6.39-ARCH"

[ -d ${TARGET_DIR}/sfs ] && rm -rf ${TARGET_DIR}/sfs
[ -d ${TARGET_DIR}/iso ] && rm -rf ${TARGET_DIR}/iso
[ -f ${TARGET_DIR}/install.iso ] && rm -rf ${TARGET_DIR}/install.iso

echo ":: Preparing pacman.conf..."
cp /etc/pacman.conf /tmp/pacman.conf.$$
sed "s@.*IgnorePkg.*@IgnorePkg = kernel26-pmac kernel26-pmac64@g" -i /tmp/pacman.conf.$$

echo ":: Installing base system to ${TARGET_DIR}..."
mkdir -p ${TARGET_DIR}/sfs/var/lib/pacman

pacman --config /tmp/pacman.conf.$$ -Sy core/base --noconfirm -r ${TARGET_DIR}/sfs || exit 1
pacman --config /tmp/pacman.conf.$$ -Syu --noconfirm -r ${TARGET_DIR}/sfs || exit 1
pacman --config /tmp/pacman.conf.$$ -Sy ${EXTRA_PACKAGES} --noconfirm -r ${TARGET_DIR}/sfs || exit 1

chroot ${TARGET_DIR}/sfs pacman -Scc --noconfirm || exit 1
if [ ! -z "${SUPERF_PACKAGES}" ]; then
	chroot ${TARGET_DIR}/sfs pacman -Rcs --noconfirm ${SUPEF_PACKAGES} || exit 1
fi

echo ":: Cleanup unnecessary files..."
rm -rf ${TARGET_DIR}/sfs/var/lib/pacman/sync
rm -rf ${TARGET_DIR}/sfs/usr/src/*
rm -rf ${TARGET_DIR}/sfs/usr/include/*
rm -f ${TARGET_DIR}/sfs/boot/kernel26.img
rm -f ${TARGET_DIR}/sfs/boot/kernel26_64.img
rm -f ${TARGET_DIR}/sfs/var/lib/pacman/*.db.tar.gz

# Create some directories default mounts use 
mkdir ${TARGET_DIR}/sfs/dev/{pts,shm}

# create mountpoint for cd
mkdir ${TARGET_DIR}/sfs/bootmnt

echo ":: Copying kernel modules... (32bit)"
cp -a /lib/modules/${KERNEL_VERSION}/ ${TARGET_DIR}/sfs/lib/modules/
echo ":: Copying kernel modules... (64bit)"
cp -a /lib/modules/${KERNEL_VERSION}64/ ${TARGET_DIR}/sfs/lib/modules/

echo ":: Moving in installer related files..."
cp -a installer/* ${TARGET_DIR}/sfs/


rm -rf ${TARGET_DIR}/iso
mkdir -p ${TARGET_DIR}/iso
( cd ${TARGET_DIR}/sfs/; mksquashfs * ${TARGET_DIR}/iso/archlive.sfs -comp gzip)

echo ":: Creating iso..."
BINS="ofpath ybin yabootconfig"
for bin in ${BINS}; do
	install -D -m755 /usr/sbin/${bin} ${TARGET_DIR}/iso/boot/${bin}
done
cp -r ${TARGET_DIR}/boot/* ${TARGET_DIR}/iso/
cp /usr/lib/yaboot/yaboot ${TARGET_DIR}/iso/boot/

mkinitcpio -c ${TARGET_DIR}/initcpio/archiso-mkinitcpio.conf -k ${KERNEL_VERSION} -g ${TARGET_DIR}/iso/boot/archlive.img
mkinitcpio -c ${TARGET_DIR}/initcpio/archiso-mkinitcpio.conf -k ${KERNEL_VERSION}64 -g ${TARGET_DIR}/iso/boot/archlive_64.img
cp /boot/vmlinux26 ${TARGET_DIR}/iso/boot/vmlinux
cp /boot/vmlinux26_64 ${TARGET_DIR}/iso/boot/vmlinux_64

mkisofs -r \
	--iso-level 2 \
        --netatalk \
	-hfs \
	-probe \
	-map ${TARGET_DIR}/boot/boot/map.hfs \
	-hfs-parms MAX_XTCSIZE=2656248 \
	--chrp-boot \
	-part \
	-no-desktop \
	-hfs-bless ${TARGET_DIR}/iso/boot \
	-hfs-volid "ArchPPC" \
	-V "ArchPPC" \
	-o ${TARGET_DIR}/install.iso \
	-v \
	${TARGET_DIR}/iso/
