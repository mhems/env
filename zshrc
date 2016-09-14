# don't run if not interactive
[ -z "$PROMPT" ] && exit

export PYTHONSTARTUP=~/.pystartup
export SHELL=zsh
export EDITOR=emacs
export PAGER=less

[ "$TERM" = xterm ] && export TERM=xterm-256color
[ "$EMACS" = t ] && unsetopt zle
eval $(dircolors)
export GREP_COLORS='1;34'

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
# setopt auto_pushd ?
setopt cdable_vars
setopt chase_dots
setopt chase_links
setopt pushd_silent
setopt pushd_to_home
# setopt bash_auto_list ?
# setopt brace expansion
setopt glob_star_short
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
# setopt pipe_fail ?
setopt multios

bindkey -e  # emacs line-editing

PROMPT="[%!] %F{green}%n@%M%f %F{blue}%~%f [%@]
%F{%0(?|green|red)}%#%f "
RPROMPT="%0(?||%F{red} %? %f)"
