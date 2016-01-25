#!/bin/bash

function link()
{
    if [ ! -e ~/$1 ]
    then
        ln -s $PWD/$1 ~/$1
        echo 'Linked' $PWD/$1 'to' ~/$1
    else
        echo "~/$1 already exists, no link was created"
    fi
}

link bin
link .emacs.d
link .bash_aliases
link .bashrc
link .gitconfig
link .gitignore
link .inputrc
link .pylintrc
link .pystartup
