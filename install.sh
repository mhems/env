#!/bin/bash

# USAGE: ./install.sh [OPTIONS]
#
# OPTIONS
#     -c    forcefully remove existing symlinks

base=$PWD
plain=(bin texmf)
dot=(emacs.d git_template bash_aliases bashrc editrc
     gitconfig gitignore pylintrc pystartup)

function symlink()
{
    src="$PWD/$1"
    dest=~/"$2$1"
    if [ ! -e $dest ]; then
        ln -s $src $dest
        echo "Symlinked $src to $dest"
    elif [ -L "$dest" ]; then
        echo "$dest already exists as symlink"
    else
        echo "$dest already exists, no symlink was created"
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
