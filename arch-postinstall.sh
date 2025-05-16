
### now in installed system

passwd #change root password
useradd -m -g users -G wheel shreyanshu
passwd shreyanshu 

pacman -S base-devel dosfstoold grub efibootmgr mtools vim networkmanager openssh sudo

systemctl enable sshd

pacman -S linux linux-headers linux-firmware

pacman -S xf86-video-vmware

mkinitcpio -p linux

# vim /etc/locale.gen  
sed -i 's/^#en_US.UTF-8/en_US.UTF-8/'  /etc/locale.gen  
locale-gen

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
