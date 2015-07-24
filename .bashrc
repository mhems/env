# BASH CONFIGURATION

# *** COLORS ***
export PROMPT_COMMAND=gen_ps1

# < move this to its own ~/.bash_aliases >
# *** ALIASES ***
# TYPOS
alias clera='clear'
alias em='emacs'
alias emasc='emacs'
alias emcas='emacs'
alias enacs='emacs'
alias maek='make'
alias sl='ls'
alias vi='vim'

# SPECIFIC OPTIONS
alias bc='bc -lq'
alias ls='ls --file-type --color'
alias la='ls -A'
alias ll='ls -lht'
alias lr='ls -lhr'
alias lla='ll -A'
alias ps='ps -Fa'
alias rm='rm -I --preserve-root'
alias wl='wc -l'
alias xterm='xterm -rv'

# CONVENIENCE
alias beep='echo -en '"'"'\a'"'"
alias cls='clear;ls'
alias cll='clear;ll'
alias csl='cls'
alias edit='emacs ~/.bashrc'
alias enter='cat >'
alias h='history | tail -n 20'
alias path='echo $PATH | sed '"'"'s/:/\n/g'"'"
alias rec='ll | head -n 20'
alias update='cp -uv'

alias dirdiff='diff -rq'
alias idiff='diff -Bibw --ignore-all-space --ignore-blank-lines'

alias cgrep='grep -c'
alias count='grep -c'
alias ngrep='grep -v'
alias search='grep -n'

# Generate PS1 dynamically to color prompt based on exit code of last command
function gen_ps1()
{
    local exitcode="$?" # must be first line
    local BOLD_GREEN='\[\e[1;32m\]'
    local GREEN='\[\e[0;32m\]'
    local BOLD_RED='\[\e[1;31m\]'
    local BOLD_BLUE='\[\e[1;34m\]'
    local END_COLOR='\[\e[m\]'
    local COLOR=$BOLD_GREEN
    if [ $exitcode -ne 0 ]; then
	COLOR=$BOLD_RED
    fi
    PS1="[\!] ${GREEN}\u#\h${END_COLOR} ${BOLD_BLUE}\w${END_COLOR} ${GREEN}[\A]${END_COLOR} ${COLOR}\$${END_COLOR} "
}
