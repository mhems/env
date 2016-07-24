#!/usr/bin/env bash

path=~/.i3/bkg_imgs
num=`ls $path | wc -l`
index=$(($RANDOM % $num))

img=`ls --color=never $path | awk 'NR==n{print $0}' n=$index`
feh --bg-scale $path/$img
