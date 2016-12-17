# don't run if not interactive
[ -z "$PROMPT" ] && exit

export PYTHONSTARTUP=~/.pystartup
export SHELL=zsh
export EDITOR=emacs
export PAGER=less
export XDG_CONFIG_HOME=~/.config

[ "$TERM" = xterm ] && export TERM=xterm-256color
[ "$EMACS" = t ] && unsetopt zle
eval $(dircolors)
export GREP_COLORS='1;34'

export WORDCHARS="${WORDCHARS//[\/._-]/}"

HISTFILE=~/.zsh_history
HISTSIZE=65536
SAVEHIST=65536

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz promptinit
promptinit

typeset -U path
path=(~/bin $path[@])
if [ -d ~/local ]
then
    path=(~/local $path[@])
fi
export PATH

. /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f /usr/share/doc/pkgfile/command-not-found.zsh ] && . /usr/share/doc/pkgfile/command-not-found.zsh
. ~/.sh_aliases

# make these source last so local configuration takes priority
[ -e ~/.localrc ] && . ~/.localrc

function p
{
    builtin dirs -v "$@"
}

function pu
{
    builtin pushd "$@"
}

function po
{
    builtin popd "$@"
}

# setopt append_history off
setopt auto_cd
cdpath=(~ ~/dev ~/cur)
# setopt auto_pushd ?
setopt cdable_vars
setopt chase_dots
setopt pushd_ignore_dups
setopt pushd_silent
setopt pushd_to_home
setopt always_to_end
setopt auto_remove_slash
# setopt bash_auto_list ?
# setopt brace expansion
setopt glob_star_short
setopt mark_dirs
setopt nomatch
setopt rc_expand_param
setopt extended_history
setopt hist_ignore_dups
setopt hist_no_store
setopt hist_reduce_blanks
# setopt hist_verify - probably not
setopt correct
# setopt print_exit_value
setopt rc_quotes
# setopt rm_star_wait ?
setopt check_jobs
setopt multios

stty -ixon

bindkey -e  # emacs line-editing

# Ctrl-N opens new urxvt in CWD
# thanks to VOid at https://faq.i3wm.org/question/150/how-to-launch-a-terminal-from-here/
nwZle() {
    zle push-line;
    BUFFER="setsid urxvt";
    zle accept-line;
}
zle -N nwZle
bindkey '^n' nwZle

PROMPT="[%!] %F{green}%n@%M%f %F{blue}%~%f [%@]
%F{%0(?|green|red)}%#%f "
RPROMPT="%0(?||%F{red} %? %f)"
