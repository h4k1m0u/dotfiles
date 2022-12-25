# Create a bootable USB
```terminal
$ sudo fdisk -l
$ sudo umount /dev/sdb1  # recommended before `dd`
$ sudo sudo mkfs.ext4 /dev/sdb1  # format filesystem
$ sudo dd bs=4M status=progress if=./archlinux-2022.12.01-x86_64.iso of=/dev/sdb  # copy iso content to usb
```

# Partitionning
- Create a `primary` partition and make it `bootable`:
```sh
$ cfdisk
```

- Change the partition's filesystem to `ext4`:
```sh
$ mkfs.ext4 /dev/sda3
```

- Mount the created partition:
```sh
$ mount /dev/sda3 /mnt
```

# Enable wireless
- Get the name of the wireless network interface:
```sh
$ ip link
```

- Connect to the wifi:
```sh
$ wifi-menu <interface-name>
```

- Test the internet connection:
```sh
$ ping -c 3 google.com
```

# Install packages
```sh
$ pacstrap /mnt base
```

- If you have trouble with key signatures:
```sh
$ vim /etc/pacman.conf
SigLevel = Never
```

# Generate fstab
- The partition containing `Archlinux` needs to be mounted automatically at boot time with `fstab`:
```sh
$ genfstab /mnt >> /mnt/etc/fstab
$ cat /mnt/etc/fstab
```

# Install GRUB bootloader
- We need to `chroot` first into the mounted partition:
```sh
$ arch-chroot /mnt /bin/bash
```

- Then install the `GRUB` bootloader package:
```sh
$ pacman -S grub os-prober
```

- And finally, `GRUB` needs to be configured:
```sh
$ grub-install /dev/sda
$ grub-mkconfig -o /boot/grub/grub.cfg
```

# Reboot the machine
```sh
$ exit
$ umount /mnt
$ reboot
```

