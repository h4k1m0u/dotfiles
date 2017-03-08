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

## Create a database user
- **Login with postgres user:** `sudo -u postgres -i`
- **Login to postgres client on server:** `psql`
- **Create a new user on server:** `CREATE USER <user>;`
- **Make this user a superuser:** `ALTER ROLE <user> Superuser;`

## Set database user password
- **Open postgres client:** `psql <database> <user>`
- **Set user's password:** `ALTER USER <user> WITH PASSWORD '<password>';`
- **Verify encrypted password:** `SELECT * FROM pg_shadow;`
- **Show location of configuration files:** `SHOW config_file;`
- **Prevent connection without password on localhost:** `vim /var/db/postgres/data96/pg_hba.conf`

And replace `trust` with `md5` in every entry of the file.

- **Reload postgres service:** `service postgresql reload`

## Dump database to remote server
- **Dump backup locally:** `pg_dump <database> > backup.sql`
- **Upload created backup to server:** `scp backup.sql remote_user@remote_host:backup.sql`
- **Create a database on server:** `CREATE DATABASE <database> OWNER <user>;`
- **Execute backup script on server:** `psql <database> <user> < backup.sql`
- **Verify database on server:** `psql <database> <user>`

## Configure gunicorn & Nginx to serve the Django application
- **Install nginx:** `pkg install nginx`
- **Install gunicorn:** `pip install gunicorn`
- **Install supervisord:** `pkg install py27-supervisor`
- **Add domain name to allowed hosts & disable debug:** `vim <project>/settings.vim`

And add the following
```python
DEBUG = False
ALLOWED_HOSTS = ['domain-name']
```
- **Test that gunicorn is working:** `gunicorn --bind 0.0.0.0:8000 <project>.wsgi:application`
- **Add vhost to nginx.conf:** `vim ./nginx.conf`

And put its content at the end of `/usr/local/etc/nginx/nginx.conf`.
- **Add gunicorn command to supervisord.conf:** `vim ./supervisord.conf`

And put its content at the end of `/usr/local/etc/supervisord.conf` (to allow supervisord to start/stop gunicorn automatically).
- **Run nginx & supervisord services at startup:** `vim /etc/rc.conf`

And add:
```sh
nginx_enable="YES"
supervisord_enable="YES"
```
- **Start nginx service:** `service nginx start`
- **Start supervisord service:** `service supervisord start`

## Backup postgresql database to Amazon S3
- **Create an S3 bucket:** [Console](https://console.aws.amazon.com/)
- **Enable bucket versionning:** [Console](https://console.aws.amazon.com/)
- **Create a user with programmatic access:** [IAM](https://console.aws.amazon.com/iam/home)
- **Grant permissions by creating a user policy:** [IAM](https://console.aws.amazon.com/iam/home)

The content of the policy can be found in [Backup policy](https://github.com/h4k1m0u/dotfiles/tree/master/digitalocean/backup.json)
- **Install wal-e with extra requirement aws:** `pip install wal-e[aws]`
- **Install envdir:** `pkg install daemontools`
- **Create a folder to store environment variables:** `mkdir -p /usr/local/etc/wal-e/env`
- **Put environment variables in separate files:**

```sh
$ echo 's3://<bucket>' > wal-e/env/WALE_S3_PREFIX
$ echo '<access-key-id>' > wal-e/env/AWS_ACCESS_KEY_ID
$ echo '<secret-access-key>' > wal-e/env/AWS_SECRET_ACCESS_KEY
$ echo '<region>' > wal-e/env/AWS_REGION
$ echo '<postgres-user-password>' > wal-e/env/PGPASSWORD
```
- **Change owner of environment variables directory:** `chown -R <postgres-user>:<postgres-user-group> wal-e`
- **Enable continuous archiving in postgres with wal-e:** `vim /var/db/postgres/data96/postgresql.conf`

And edit the following variables:
```sh
wal_level = archive
archive_mode = on
archive_command = 'envdir /usr/local/etc/wal-e/env wal-e wal-push %p'
archive_timeout = 0

logging_collector = on
log_directory = 'pg_log'
```
- **Install wal-e dependencies:** `pkg install lzop pv`
- **Restart postgres service:** `service postgresql restart`

`Wal-e` and `Postgresql` will start automatically the archiving of the databases because `archive_mode=on`.
- **Change to postgres user:** `sudo su <postgres-user>`
- **Test push command:** `envdir /usr/local/etc/wal-e/env wal-e backup-push /var/db/postgres/data96`
- **Test delete command:** `envdir /usr/local/etc/wal-e/env wal-e delete --confirm retain 1`
- **Open postgres user's cron file:** `crontab -e`
- **Run weekly on Sunday midnight:**

Copy content of [Cron](https://github.com/h4k1m0u/dotfiles/tree/master/digitalocean/cron) inside the opened file.

Note that this cron file also deletes older backups to keep only the most recent one (The one just uploaded).

## Restore postgresql database from Amazon S3
- **Shutdown postgres:** `service postgresql stop`
- **Rename old postgres directory:** `mv <postgres-dir> <old-postgres-dir>`
- **Init new database:** `sudo service postgresql initdb`
- **Fetch latest backup:** `envdir /usr/local/etc/wal-e/env wal-e backup-fetch /var/db/postgres/<postgres-dir> LATEST`
- **Configure fetch command in postgres:** `vim <postgres-dir>/recovery.conf`

And add the following:
```sh
restore_command = 'envdir /usr/local/etc/wal-e/env wal-e wal-fetch "%f" "%p"'
```
- **Copy postgres configuration files with archiving enabled:** `cp <old-postgres-dir>/{postgresql.conf,pg_hba.conf} <postgres-dir>`
- **Recover backup on postgresql startup:** `service postgresql start`
