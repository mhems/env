#!/bin/sh

xrdb -merge ~/.Xresources
xrdb -merge ~/.Xresources.solarized

xset dpms 1800 1800 1800

exec conky &> /dev/null &
exec xss-lock lock &> /dev/null &
