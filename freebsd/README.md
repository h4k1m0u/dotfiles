## Installing a package using the package manager
- **Search for the package:** `pkg search <package>`
- **Install package:** `pkg install <package>`

## Install a port
- **Grab the ports collection:** `portsnap fetch`
- **Extract screeshot to /usr/ports:** `portsnap extract`
- **If you want to update collection later:** `portsnap fetch update`
- **Look for a port:** `whereis <port>`
- **Install port:** `cd /usr/ports/<path-to-port> && make install clean`
