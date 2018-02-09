In the following is explained how to install a package present on the [aur](https://aur.archlinux.org/). Two methods are proposed:

# Manual
## Install a python module with pacman (e.g. numpy)
```sh
$ pacman -S python-numpy
```

## Install a python module from AUR (e.g. python-mvpa2)
```sh
$ wget https://aur.archlinux.org/cgit/aur.git/snapshot/python-mvpa2-git.tar.gz
$ tar -zxvf python-mvpa2-git.tar.gz
$ cd python-mvpa2-git
$ makepkg -sci
```

## Create a virtual environment (e.g. to use python2)
```sh
$ pip install virtualenv
$ virtualenv --python=python2 .
$ source bin/activate
$ python --version
```

# Automatic
After having installed `pacaur` manually from the AUR using the method above:

```sh
$ pacaur <package-name>
```
