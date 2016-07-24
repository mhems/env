xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources.solarized

exec ~/.i3/subscribe.py &
exec conky &> /dev/null &
