#!/usr/bin/bash

compressed_diskimage_name=$1

# Decompress downloaded coreos image
echo Decompressing CoreOS image, this may take a while...
xz -dkc /root/src/"$compressed_diskimage_name" > /root/src/coreos.img
echo CoreOS image extracted successfully.

# Install hybrid MBR table for compatibility with Raspberry Pi 3
dd if=/root/src/hybrid-mbr.img of=/root/src/coreos.img bs=512 count=1 conv=notrunc

# Download Raspberry Pi 3 UEFI bootloader and unzip
echo Downloading UEFI bootloader
wget -q https://github.com/pftf/RPi3/releases/download/v1.37/RPi3_UEFI_Firmware_v1.37.zip
mkdir efi
unzip RPi3_UEFI_Firmware_v1.37.zip -d efi

# Install bootloader into coreos image
echo Installing bootloader
cp /root/bootpart-commands.txt /root/commands.txt
/root/guestfish.sh coreos.img 2

# Configure CoreOS Ignition
#cp /root/ignition-commands.txt /root/commands.txt
#/root/guestfish.sh coreos.img #TODO
