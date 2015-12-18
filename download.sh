#!/bin/bash

# maintain arrays in parallel
declare -a commands=(apt-get   zypper   yum)
declare -a options=( -yq       -nq      -yq)
declare -a programs=(
    emacs
    vim
    nano

    meld
    colordiff
    wdiff

    clang
    ddd
    valgrind
    swi-prolog
    ghc
    ruby
    rails
    golang-go
    default-jre
    default-jdk
    python-pip3
    python3-pip
    pylint
    
    texlive-binaries
    texlive-latex-base

    git
    cvs

    ant
    pccts
    flex
    bison

    ranger
    ffmpegthumbnailer
    img2txt
    caca-utils
    highlight
    atool
    mediainfo
    exiftool

    vlc-nox
)

# Determine which package manager to use
found=1
for i in `seq 0 ${#commands[@]}`
do
    which ${commands[$i]} &> /dev/null
    if [[ $? -eq 0 ]]
    then
	      found=0
	      index=$i
	      break
    fi
done

if [[ $found -eq 1 ]]
then
    echo 'Unable to determine package manager, please edit the arrays at the top of this file'
    exit 1
fi

for program in ${programs[@]}
do
    sudo ${commands[$index]} ${options[$index]} install $program
done
