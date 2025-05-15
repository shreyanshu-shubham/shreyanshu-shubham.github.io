setfont ter-114b

wipefs -a /dev/sda

(
# EFI PART
echo g # Create a new empty DOS partition table
echo n # Add a new partition
echo   # Partition number
echo   # First sector (Accept default: 1)
echo +1G # Last sector
# boot PART
echo n # Add a new partition
echo   # Partition number
echo   # First sector (Accept default: 2)
echo +1G # Last sector
# boot PART
echo n # Add a new partition
echo   # Partition number
echo   # First sector (Accept default: 3)
echo   # Last sector

echo w # Write changes
) | fdisk /dev/sda

mkfs.fat -F 32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3

mount /dev/sda3 /mnt
mount --mkdir /dev/sda2 /mnt/boot
mount --mkdir /dev/sda1 /mnt/boot/EFI

pacstrap -K /mnt base linux linux-firmware linux-headers
genfstab -U /mnt >> /mnt/etc/fstab
