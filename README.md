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
