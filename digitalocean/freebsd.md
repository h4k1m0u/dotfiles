# Configure FreeBSD DigitalOcean droplet
The default user `freebsd` does already belong to the `wheel` group (i.e. `sudoers`).

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

## Change login announcement:
- **Edit motd file:** `cp ~/github/dotfiles/freebsd/motd /etc/motd`

## Install Python
- **Install python3:** `pkg install python3`
- **Create a symlink to python:** `sudo ln -s /usr/local/bin/python3.5 /usr/local/bin/python`
- **Install pip:** `sudo python -m ensurepip`
- **Create a symlink to pip:** `sudo ln -s /usr/local/bin/pip3 /usr/local/bin/pip`

## Install PostgreSQL
- **Install postgresql client & server:** `sudo pkg install postgresql96-server postgresql96-client` 
- **Load postgresql service at startup:** `vim /etc/rc.conf`

And add `postgresql_enable="YES"`
- **Initialize postgresql database:** `sudo service postgresql initdb`
- **Start postgresql service:** `sudo service postgresql start`
- **Check that postgresql service is running:** `sudo service postgresql status`
- **Change postgres user password:** `sudo passwd postgres`
- **Change shell to bash for postgres user:** `chsh -s bash`

## Dump database to remote server
- **Login with postgres user:** `sudo -u postgres -i`
- **Login to postgres client on server:** `psql`
- **Create a new user on server:** `CREATE USER <user>;`
- **Make this user a superuser:** `ALTER ROLE <user> Superuser;`
- **Create a database on server:** `CREATE DATABASE <database> OWNER <user>;`
- **Dump backup locally:** `pg_dump <database> > backup.sql`
- **Upload created backup to server:** `scp backup.sql remote_user@remote_host:backup.sql`
- **Execute backup script on server:** `psql <database> <user> < backup.sql`
- **Verify database on server:** `psql <database> <user>`
