In the following is explained how to install a package present on the [aur](https://aur.archlinux.org/):

```terminal
$ git clone https://aur.archlinux.org/dropbox.git
$ vim PKGBUILD  # locate the key in `validpgpkeys='...'`
$ gpg --recv-keys <key>
$ makepkg -sci
```

# Automatic
**Update 01-01-23: Yet to be re-tested**

After having installed `pacaur` manually from the AUR using the method above:

```sh
$ pacaur <package-name>
```
