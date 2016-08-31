# Setup the wifi

## Install wireless manager
```sh
$ pacman -S dialog wifi-supplicant
```

- And then connect to the wifi as usual with:
```sh
$ wifi-menu <interface-name>
```

## Connect to wifi on startup
```sh
$ netctl list
$ netctl enable <profile-name>
```

# Set a static IP address

## Edit the configuration file
```sh
$ vim /etc/netctl/<profile-name>
```

- Replace `IP=dhcp` by the following:

```sh
IP=static
Address=('192.168.0.100/24')
Gateway=('192.168.0.1')
DNS=('192.168.0.1' '8.8.8.8' '8.8.4.4')
```

## Restart the network
```sh
$ netctl restart <profile-name>
```

## Verifiy the new IP address
```sh
$ ip addr
```
