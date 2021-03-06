# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

#This script allows you to see repository status in your prompt.
source ~/.git-prompt.sh

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
#HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1) \$  '
else
    PS1='${debian_chroot:+($debian_chroot)}\w$(__git_ps1) \$  '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# START Personal Configuration

PROMPT_DIRTRIM=2 # Show only two trailing directories on the prompt

export PATH="$PATH:/home/sachin/sbin:/home/sachin/Scripts:/home/sachin/bin:/home/sachin/projects/android/android-studio/bin/:/home/sachin/projects/android/genymotion/"
#for node.js
export PATH="$PATH:/home/sachin/.nodes/current/bin/"
export PATH="$PATH:/home/sachin/npm/bin/"
#for android studio
export PATH="$PATH:/home/sachin/projects/android/adt-bundle/sdk/platform-tools:/home/sachin/projects/android/adt-bundle/sdk/tools/"
export CVSROOT=:ext:sdivekar@10.1.1.8:/var/local/cvs/repository
export ANDROID_HOME="/home/sachin/projects/android/adt-bundle/sdk/"
export GRADLE_HOME="/home/sachin/gradle/current"

# for laravel
export PATH="$PATH:/home/sachin/.composer/vendor/bin/"

# To save history in a seperate file
export PROMPT_COMMAND="history 1 >> /home/sachin/.my_bash_history"

# To record time in command history
export HISTTIMEFORMAT="%d %h %Y - %H:%M:%S "


eval "$(rbenv init -)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Add aliases

alias ib='ionic build android'
alias ir='ionic run android'
alias spm='sudo pm-suspend'
alias gst='git status'
alias pingtest='ping 8.8.8.8'

#mkdcd() { mkdir $1 && cd $1; }
gd() { git diff $1 ; }

# Swap caps and ctrl keys
setxkbmap -option ctrl:swapcaps
setxkbmap -option ctl:nocaps

# Open VIM without reading vimrc file
alias vil='vim -u NONE'

# Open emacsclient in current tty
alias emcl='emacsclient -t'
