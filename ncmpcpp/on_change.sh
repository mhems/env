#!/usr/bin/env bash

EXPIRE_TIME=5000
msg=""

add_nonempty_attr()
{
    attr_val="`mpc current -f %$1%`"
    if [ -n "$attr_val" ]
    then
        add="${1^}: $attr_val"
        if [ -z "$msg" ]
        then
            msg="$add"
        else
            msg="${msg}\n${add}"
        fi
    fi
}

add_nonempty_attr "title"
add_nonempty_attr "artist"
add_nonempty_attr "album"

# if metadata absent, revert to filename
if [ -z "$msg" ]
then
    file="`mpc current -f %file%`"
    msg="`basename $file`"
    msg="${msg%.*}" # strip extension
fi

notify-send -t $EXPIRE_TIME "$msg"
