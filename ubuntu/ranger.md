# Ranger shortcuts
- **Select all/invert selection:** `v`
- **Revert selection:** `uv`
- **Show/hide hidden files:** `<backspace>`
- **Bookmark current location:** `m` then `<key>`
- **Show bookmarked paths:** `<backtick>` `<key>`
- **Copy & paste folder:** `yy` then `pp`
- **Cut & paste folder:** `dd` then `pp`
- **Search by filename:** `/` or `f`
- **Show files modification time:** `M` then `m`
- **Last modified file at bottom:** `o` then `C`
- **Go backward in history:** `H`
- **Go forward in history:** `L`
- **Create (close) a new tab:** `g` then `n` (`c`)
- **Navigate to next (previous) tab:** `g` then `t` (`T`), or `tab` (`<S-tab>`)
- **Enlarge current tab:** `~`

## Config file
- **Copy config file for rifle:** `$ ranger --copy-config=rifle`
- **Reading ply with CloudCompare:**

```console
$ vim ~/.config/ranger/rifle.conf

ext ply = CloudCompare "$@"`
```

## Running a shell command
- **Run shell command:** `s`
- **Run shell command in the background:** `:shell -f CloudCompare %f`
