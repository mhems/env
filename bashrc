[ -z "$PS1" ] && exit

export PYTHONSTARTUP=/home/`whoami`/.pystartup
export SHELL=/bin/bash
export EDITOR=/usr/bin/emacs

export PROMPT_COMMAND=gen_ps1
[ $TERM = xterm ] && export TERM=xterm-256color
eval $(dircolors)
export GREP_COLORS='1;34'

export PATH=~/bin:$PATH

. ~/.bash_aliases

# make these appear last so local configuration takes priority
[ -e ~/.localrc ] && . ~/.localrc
[ -d ~/local ] && export PATH=~/local:$PATH

function dirs
{
    builtin dirs -v "$@"
}

function pushd
{
    builtin pushd "$@" > /dev/null
}

function popd
{
    builtin popd "$@" > /dev/null
}

# Generate PS1 dynamically to color prompt based on exit code of last command
function gen_ps1()
{
    local exitcode="$?" # must be first line
    local BOLD_GREEN='\[\e[1;32m\]'
    local GREEN='\[\e[0;32m\]'
    local BOLD_RED='\[\e[1;31m\]'
    local BOLD_BLUE='\[\e[1;34m\]'
    local END='\[\e[m\]'
    local RC=$BOLD_GREEN
    if [ $exitcode -ne 0 ]; then
        RC=$BOLD_RED
    fi
    local title=''
    if [ $TERM != dumb ]; then
        title='\[\e]0;\W\a\]'
    fi
    PS1="${title}[\!] ${GREEN}\u@\h${END} ${BOLD_BLUE}\w${END} \
${GREEN}[\A]${END}\n${RC}\$${END} "
}
