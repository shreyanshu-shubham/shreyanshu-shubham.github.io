
### now in installed system

passwd #change root password
useradd -m -g users -G wheel shreyanshu
passwd shreyanshu 

pacman -S base-devel dosfstoold grub efibootmgr mtools nano networkmanager openssh sudo
    os-prober # if dual boot
    gnome gnome-tweaks # for gnome de

systemctl enable --now sshd

pacman -S linux linux-headers linux-firmware

if intel/amd gpu use `lspci` to figure it out
    pacman -S mesa
for nvidia
    pacman -S nvidia nvidia-utils

if intel newer than including broadwell for hardware decoding
    pacman -S intel-media-driver
for amd hardware decoding
    pacman -S libva-mesa-driver

for virtual box (vmware)
    pacman -S xf86-video-vmware

mkinitcpio -p linux

nano /etc/locale.gen  
uncomment your locale
locale-gen

grub config location : /etc/defaut/grub

mkdir /boot/EFI
mount efi-partition here

grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable gdm
systemctl enable NetworkManager

exit
umount -a 
reboot