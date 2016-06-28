# *** ALIASES ***

# TYPOS
alias emasc='emacs'
alias emcas='emacs'
alias enacs='emacs'
alias gti='git'
alias maek='make'
alias sl='ls'

# SPECIFIC OPTIONS
alias clang++='clang++ -Wall -Wextra -pedantic -std=c++11'
alias em='/usr/bin/emacs -nw'
alias gcc='gcc -Wall -Wextra -pedantic'
alias gdb='gdb -q'
alias g++='g++ -Wall -Wextra -pedantic -std=c++11'
alias grep='grep --color=auto'
alias ls='ls -F --file-type --color=auto'
alias la='ls -A'
alias ll='ls -lht'
alias lr='ls -lhr'
alias lla='ll -A'
alias ps='ps -Fa'
alias rm='rm -i --preserve-root'
alias val='valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20'
alias wl='wc -l'

# CONVENIENCE
alias edit='emacs ~/.bashrc'
alias enter='cat >'
alias h='history | tail -n 20'
alias path='echo $PATH | sed '"'"'s/:/\n/g'"'"
alias rec='ll | head -n 20'
alias plz='sudo bash -c "$(history -p !!)"'
alias off='sudo ~/bin/off'
alias py='python3'
alias dirdiff='diff -rq'
alias idiff='diff -Bibw --ignore-all-space --ignore-blank-lines'
alias open='rifle -f f'
