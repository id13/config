

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

redshift-gtk -l 45:2 -t 4200:2200 &

xbindkeys

rate
xset r rate 270 30
xrandr --dpi 190
export QT_AUTO_SCREEN_SCALE_FACTOR=1
exec startkde
