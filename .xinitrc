
DEFAULTSESSION=i3-session

[[ -f ~/.Xdefaults ]] && xrdb -merge ~/.Xdefaults
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

redshift-gtk -l 45:2 -t 4200:2200 &

xbindkeys &
screen-left
sh screen-left.sh
feh --bg-fill ~/wallpaper.jpg

xset r rate 200 50&
unclutter &
exec i3 --shmlog-size=26214400
