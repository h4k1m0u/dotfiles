# Install GUI apps as root
Because new systems don't allow graphical applications (e.g. FoxitReader run file) to run as root ([source][1]), this workaround allows to install them from terminal:

```bash
xhost si:localuser:root
sudo ./*.run
xhost -si:localuser:root
```

[1]: https://unix.stackexchange.com/a/436332/36712
