# Create a new user
```sh
$ useradd -m -G wheel -s /bin/bash hakim
$ passwd hakim

```

# Add sudo privileges
```sh
$ pacman -S sudo
$ visudo
```

- Now uncomment the following line: `%wheel ALL=(ALL) ALLL`.
