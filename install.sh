#!/bin/bash

# USAGE: ./install.sh [OPTIONS]
#
# OPTIONS
#     -c    forcefully remove existing symlinks

base=$PWD
plain=(bin texmf)
dot=(
     emacs.d
     xsession Xresources Xresources.solarized
     bashrc sh_aliases editrc
     zshrc
     git_template gitconfig gitignore
     pylintrc pystartup
     i3 i3status.conf
     ssh/config
     config/ranger config/conky config/mpv config/mpd config/dunst
     ncmpcpp
     )

function symlink()
{
    target="$PWD/$1"
    name=~/"$2$1"
    if [ ! -e "$name" ]; then
        ln -s "$target" "$name"
        echo "Symlinked $name to $target"
    elif [ -L "$name" ]; then
        echo "$name already exists as symlink"
    else
        echo "$name already exists, no symlink was created"
    fi
}

if [ "$1" = '-c' ]; then
    shift
    for f in "${plain[@]}"; do
        rm -f "~/$f"
        echo "Removed ~/$f symlink"
    done
    for f in "${dot[@]}"; do
        rm -f "~/.$f"
        echo "Removed ~/.$f symlink"
    done
fi

for f in "${plain[@]}"; do
    symlink "$f"
done
for f in "${dot[@]}"; do
    symlink "$f" '.'
done
