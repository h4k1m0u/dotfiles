# Installing a package using the package manager
- **Search for the package:** `pkg search <package>`
- **Install package:** `pkg install <package>`

# Install a port
- **Grab the ports collection:** `portsnap fetch`
- **Extract screeshot to /usr/ports:** `portsnap extract`
- **If you want to update collection later:** `portsnap fetch update`
- **Look for a port:** `whereis <port>`
- **Install port:** `cd /usr/ports/<path-to-port> && make install clean`

# Upgrade to latest release
Following this [tutorial](https://www.digitalocean.com/community/tutorials/how-to-upgrade-freebsd-from-version-10-2-to-10-3):

- **Fetch & apply patches:** `sudo freebsd-update upgrade -r 11.1-RELEASE`
- **Resolve conflicts:** When `/etc/ssh/sshd_config` is opened in `vi`, remove lines related to previous `FreeBSD` version
- **Install downloaded updates:** `sudo /usr/sbin/freebsd-update install`
- **Reboot & complete installation:** `sudo reboot` then `sudo /usr/sbin/freebsd-update install`
- **Check FreeBSD version:** `uname -a`
- **Update packages installed:** `sudo pkg upgrade`
