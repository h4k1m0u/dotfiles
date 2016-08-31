# Install and start pulseaudio
```sh
$ pacman -S pulseaudio
$ pulseaudio --start
```

# Install pavucontrol
```sh
$ pacman -S pavucontrol
```

- And check that the sound output is not muted.
- You can also use `pavucontrol` to adjust the sound volume.

# Test the sound
```sh
$ pacman -S mpv
$ mpv *wav
```
