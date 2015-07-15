
DEFAULTSESSION=i3-session

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

redshift -l 45:2 &

# xrandr --newmode "1920x1200" 192.83 1920 2048 2256 2592 1200 1201 1204 1242 -hsync +vsync
# xrandr --addmode HDMI3 1920x1200
# xrandr --output HDMI3 --mode 1920x1200 --right-of eDP1
xbindkeys &
feh --bg-scale ~/wallpaper.jpg

xset r rate 200 50&
exec i3 --shmlog-size=26214400
