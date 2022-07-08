xrdb .Xresources
setxkbmap -layout gb
picom -b --config $HOME//config/picom/picom.conf
feh --bg-fill --randomize $HOME/pictures/wallpapers/*
exec i3
