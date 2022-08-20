/usr/bin/bash

diskimage_name=$1

# Download Raspberry Pi 3 UEFI bootloader and unzip
wget https://github.com/pftf/RPi3/releases/download/v1.37/RPi3_UEFI_Firmware_v1.37.zip
mkdir efi
unzip RPi3_UEFI_Firmware_v1.37.zip -d efi

# Install bootloader into coreos image
cp /root/bootpart-commands.txt /root/commands.txt
/root/guestfish.sh $diskimage_name 2

#cp /root/ignition-commands.txt /root/commands.txt
#/root/guestfish.sh $diskimage_name #TODO
