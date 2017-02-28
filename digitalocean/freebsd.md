# Configure FreeBSD DigitalOcean droplet

## Generate client ssh key 

- **Generate the client's public and private keys:** `$ ssh-keygen -t rsa`
- **Copy content of public key to DO's control panel:** `vim ~/.ssh/id_rsa.pub`
- **Test SSH connection:** `ssh freebsd@<ip-address>`

## Use bash instead of the default shell

- **Install bash:** `$ sudo pkg install bash`
- **Add the file-descriptor file system needed by bash:** `$ sudo sh -c 'echo "fdesc /dev/fd fdescfs rw 0 0" >> /etc/fstab'`
- **Mount the filesystem added:** `$ sudo mount -a`
- **Change default shell to bash for current user:** `$ sudo chsh -s /usr/local/bin/bash freebsd`
- **Verify bash is default shell:** `$ echo $0` or `ps -p $$`
- **Customizing bash:** Use `.bash_profile` instead of `.bashrc` for login shells.
