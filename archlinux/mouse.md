# Install the mouse driver
```sh
$ pacman -S xf86-input-libinput
```

# Copy the configuration file
```sh
$ cp /usr/share/X11/xorg.conf.d/60-libinput.conf /etc/X11/xorg.conf.d/
```

# Enable touchpad tapping
```sh
$ vim /etc/X11/xorg.conf.d/60-libinput.conf
```
And add `Option "Tapping" "on"` to the `touchpad` section.

# Restart X
Logout of `I3` with `<Alt-e>` and login again with:
```sh
$ startx
```
