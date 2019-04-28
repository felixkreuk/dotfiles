## i3
### Monitor Layout
To make the monitor layout persistent across restarts, need to create an xorg.conf file. To do that, need to download nvidia drivers, then, need to run
```
sudo nvidia-settings
```
to configure monitors, and then save the configuration as `/etc/X11/xorg.conf.d/xorg.conf`

### KDE-themes + i3
Create `~/.xprofile` and paste:
```
export XDG_CURRENT_DESKTOP=KDE
```
To run the kde-settings app run `systemsettings5` in terminal.

### Make i3 Default WM
Following https://github.com/nightsh/i3-plasma this worked for me:
```
echo "export KDEWM=/usr/bin/i3" > ~/.config/plasma-workspace/env/wm.sh
```
Notice the name is `wm.sh` and not `set_window_manager.sh` as the repo suggested.

## Kitty Terminal
In case kitty is messing up characters see the [following](https://sw.kovidgoyal.net/kitty/faq.html?highlight=ssh#id4).
