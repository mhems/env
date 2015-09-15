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
alias clang++='clang++ -Wall -Wextra -pedantic -std=c++11'
alias gcc='gcc -Wall -Wextra -pedantic'
alias gdb='gdb -q'
alias g++='g++ -Wall -Wextra -pedantic -std=c++11'
alias ls='ls -F --file-type --color'
alias la='ls -A'
alias ll='ls -lht'
alias lr='ls -lhr'
alias lla='ll -A'
alias ps='ps -Fa'
alias rm='rm -I --preserve-root'
alias val='valgrind  --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes' # --track-origins=yes
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
