# Mount an external hard-drive
```sh
$ fdisk -l
$ mkdir /mnt/seagate
$ pacman -S ntfs-3g
$ mount /dev/sdb1 /mnt/seagate -t ntfs-3g
```
