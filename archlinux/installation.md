Following the official [installation guide][installation-guide] and [this tutorial][tutorial]:

[installation-guide]: https://wiki.archlinux.org/title/Installation_guide
[tutorial]: https://itsfoss.com/install-arch-linux/

# Create a bootable USB
```terminal
$ sudo fdisk -l
$ sudo dd bs=4M status=progress if=./archlinux-2022.12.01-x86_64.iso of=/dev/sdb && sync  # copy iso content to usb & flush
```

# Partitionning
- Boot into `UEFI without CSM` mode (not Legacy BIOS mode). If the boot mode is correct, the folder below should exist:
```terminal
$ ls /sys/firmware/efi/efivars
```

- Using `cfdisk`:
    - Create a boot `EFI` partition of 512M.
    - Create a `primary` partition of the default `Linux` type.

- Format both partitions as fat32 and ext4 filesystems resp.:
```sh
$ mkfs.fat -F 32 /dev/sda1
$ mkfs.ext4 /dev/sda2
```

# Connect to wifi
```sh
$ ip link
$ iwctl --passphrase <password> station <device> connect <ssid>
$ ping -c 3 google.com
```

# Install Archlinux, kernel, and firmware
```sh
$ mount /dev/sda2 /mnt
$ pacstrap /mnt base linux linux-firmware
```

- If you have trouble with key signatures:
```sh
$ vim /etc/pacman.conf
SigLevel = Never
```

# Generate fstab
- The partition containing `Archlinux` needs to be mounted automatically at boot time with `fstab`:
```sh
$ genfstab -U /mnt >> /mnt/etc/fstab
$ cat /mnt/etc/fstab
```

# Set root password
```sh
$ passwd
```

# Install GRUB bootloader
- We need to `chroot` first into the mounted partition:
```sh
$ arch-chroot /mnt /bin/bash
```

- Then install the `GRUB` bootloader package:
```sh
$ pacman -S grub efibootmgr
```

- And finally, `GRUB` needs to be configured:
```sh
$ mkdir /boot/efi
$ mount /dev/sda1 /boot/efi
$ grub-install --target=x86_64-efi -bootloader-id=GRUB --efi-directory=/boot/efi
$ grub-mkconfig -o /boot/grub/grub.cfg
```

# Install desktop environment
```terminal
$ pacman -S xorg gnome
$ systemctl enable gdm.service
```

# Install network manager
```terminal
$ pacman -S networkmanager
$ systemctl enable NetworkManager.service
$ nmtui  # used after reboot to connect to wifi
```

# Before rebooting
```terminal
$ sudo mount /dev/sda1 /boot/efi
$ cd /boot/efi/
$ ll EFI/GRUB/grubx64.efi  # path to provide in BIOS
```

# Reboot the machine
```sh
$ exit
$ umount -l /mnt
$ reboot
```

# Configure BIOS
As suggested in [this thread][askubuntu], to boot automatically on grub with HP laptops (without having to select GRUB), head to BIOS configuration:

- Leave `UEFI without CSM` mode selected.
- Make sure `Customize Boot` is checked and put it at the top of the boot order.
- Define customized boot > Add, and set it to: `\EFI\GRUB\grubx64.efi`

[askubuntu]: https://askubuntu.com/a/663388/146620
