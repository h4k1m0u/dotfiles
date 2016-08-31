# Install and configure the audio driver

## Install and start pulseaudio
```sh
$ pacman -S pulseaudio
$ pulseaudio --start
```

## Install pavucontrol
```sh
$ pacman -S pavucontrol
```

- And check that the sound output is not muted.
- You can also use `pavucontrol` to adjust the sound volume.

## Test the sound
```sh
$ pacman -S mpv
$ mpv *wav
```

# Install and configure the bluetooth speaker

## Install and start the service
```sh
$ pacman -S pulseaudio-bluetooth
$ systemctl start bluetooth
```

## Install the bluetooth manager
```sh
$ pacman -S bluez bluez-utils
```

## Pair with the bluetooth device
```sh
$ bluetoothctl
```

And start the pairing with:
```sh
$ power on
$ agent on
$ default-agent
$ scan on
$ pair <mac-addresss>
$ connect <mac-address>
```
