#!/bin/bash

# Phrase 1

# Connect to the internet
ping -c 5 archlinux.org || exit 1;

# Update the system clock
timedatectl set-ntp true

# Partition the disks
wipefs -af /dev/sda
parted -s -- /dev/sda mklabel gpt
# if start with 0, it will warning: the resulting partition is not properly aligned for best performance.
parted -s -- /dev/sda mkpart primary 1m 2m
parted -s -- /dev/sda mkpart primary 2m -1
parted /dev/sda set 1 bios_grub on

# Format the partitions
mkfs.ext4 /dev/sda2

# Mount the file systems
mount /dev/sda2 /mnt

# Installation
# Select the mirrors
# https://wiki.archlinux.org/index.php/Reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

# Install essential packages
pacstrap /mnt base linux linux-firmware

# Configure the system
# Fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot
arch-chroot /mnt

# Phrase 2

# Localization
sed -E -i 's/^#en_US.UTF(.*)/en_US.UTF\1/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf

# Network configuration
echo go > /etc/hostname

# Initramfs
mkinitcpio -P

# Root password
echo "root:123456" | chpasswd

# Boot loader
pacman -S grub
grub-install --target=i386-pc /dev/sda 
grub-mkconfig -o /boot/grub/grub.cfg

# Install app
# libfido2 for U2F authentication
pacman -S base-devel fish alsa-utils ranger man vim dosfstools ntfs-3g exfat-utils parted openssh screen tmux p7zip zip unzip git gnupg lsof ntp gnu-netcat nmap cronie bc dstat tree dhclient neofetch lshw libfido2 sysstat linux-headers imagemagick python-pip wireguard-tools

# Display drivers

# First, identify your card: 
lspci | grep -e VGA -e 3D

# The drag-and-drop (copy/paste) feature requires both open-vm-tools and gtkmm3 packages to be installed.
pacman -S mesa xf86-input-vmmouse xf86-input-libinput xf86-video-vmware open-vm-tools gtkmm3 
systemctl enable vmtoolsd 
systemctl enable vmware-vmblock-fuse

# pacman -S xorg-server xorg-apps xorg-xinit i3-wm rofi
# cp /etc/X11/xinit/xinitrc ~/.xinitrc
# add exec i3 in .xinitrc, then run startx

# sway
pacman -S sway swaylock swayidle swaybg wofi

# app
pacman -S alacritty noto-fonts noto-fonts-cjk ttf-opensans pcmanfm gtk4 mupdf firefox telegram-desktop mpv

# enable sshd
systemctl enable sshd systemd-networkd system-resolved

# add user
useradd -ms /bin/fish xx
echo "xx:123456" | chpasswd
echo "xx   ALL=(ALL:ALL) ALL" >> /etc/sudoers

# Reboot
exit
umount -R /mnt
reboot



