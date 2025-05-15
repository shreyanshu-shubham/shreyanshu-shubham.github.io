setfont ter-114b

read -p "Enter the drive: " var_drive_path

wipefs -a ${var_drive_path}

(
# EFI PART
echo g # Create a new empty DOS partition table
echo n # Add a new partition
echo   # Partition number
echo   # First sector (Accept default: 1)
echo +1G # Last sector (Accept default: varies)
# boot PART
echo n # Add a new partition
echo   # Partition number
echo   # First sector (Accept default: 1)
echo +1G # Last sector (Accept default: varies)
# root PART
echo n # Add a new partition
echo   # Partition number
echo   # First sector (Accept default: 1)
echo   # Last sector (Accept default: varies)

echo w # Write changes
) | fdisk ${var_drive_path}

mkfs.fat -F 32 ${var_drive_path}1
mkfs.ext4 ${var_drive_path}2
mkfs.ext4 ${var_drive_path}3

mount ${var_drive_path}3 /mnt
mount --mkdir ${var_drive_path}2 /mnt/boot
mount --mkdir ${var_drive_path}1 /mnt/boot/EFI

pacstrap -K /mnt base linux linux-firmware linux-headers
genfstab -U /mnt >> /mnt/etc/fstab
