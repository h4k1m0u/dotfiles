# Install SSH
```sh
$ pacman -S openssh
```

# SSH client

## Configure key-authentification
- Generate the `public` and `private` keys on the `client-side` with:
```sh
$ ssh-keygen
```

- Copy the generated `public` key (`id_rsa.pub`) to the server with:
```sh
$ ssh-copy-id user@remote
```

- Then you can connect to the remote `server` with:
```sh
$ ssh user@remote
```

# SSH server

## Run the server
```sh
$ systemctl start sshd
$ systemctl enable sshd
```
