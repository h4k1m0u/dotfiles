
# Install wireless manager
```sh
$ pacman -S dialog wifi-supplicant
```

- And then connect to the wifi as usual with:
```sh
$ wifi-menu <interface-name>
```

# Connect to wifi on startup
```sh
$ netctl list
$ netctl enable <profile-name>
```
