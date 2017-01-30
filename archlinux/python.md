# Install a python module with pacman (e.g. numpy)
```sh
$ pacman -S python-numpy
```

# Install a python module from AUR (e.g. python-mvpa2)
```sh
$ wget https://aur.archlinux.org/cgit/aur.git/snapshot/python-mvpa2-git.tar.gz
$ tar -zxvf python-mvpa2-git.tar.gz
$ cd python-mvpa2-git
$ makepkg -sc
$ pacman -U python-mvpa2-git-[xxx].pkg.tar.xz
```
