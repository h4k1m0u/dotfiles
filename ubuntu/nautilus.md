# Customize sidebar bookmarks
In Ubuntu 18.04 LTS (bionic beaver)

- Add to `~/.config/user-dirs.conf`: enabled = false
- Comment out everything in `~/.config/user-dirs.dirs`.
- Edit `~/.config/gtk-3.0/bookmarks` by adding your own bookmarks:

```
file:///home/hakim/repos/flask-webapp flask-webapp
file:/// Root
```