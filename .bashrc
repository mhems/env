# BASH CONFIGURATION

# *** COLORS ***
export PROMPT_COMMAND=gen_ps1
export SHELL="/bin/bash"
export EDITOR="/usr/bin/emacs"
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:'

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
