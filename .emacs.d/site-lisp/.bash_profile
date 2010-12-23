# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export DISPLAY=192.168.2.65:0.0
export MF_ROOT=/home/wanghu/work/vgame/srv
export BW_RES_PATH=$MF_ROOT/vgame/res:$MF_ROOT/bigworld/res
export BW_TIMING_METHOD=gettimeofday
export MF_CONFIG=Hybrid
export PYTHONPATH=$MF_ROOT/bigworld/tools/server/pycommon

export HISTTIMEFORMAT='%F %T '
export HISTCONTROL=ignoredups

alias ll='ls -l'
alias la='ls -al'
alias vi='vim'
alias emacs='emacs -nw'
alias bwpanel='/home/wanghu/work/vgame/srv/bigworld/tools/server/bwpanel/bwpanel &'
alias cdw='cd /home/wanghu/work/vgame/srv/vgame/res/entities/'
alias svnw='svn up /home/wanghu/work/vgame/srv/'
alias telvbase='telnet 192.168.2.248 40065'
alias telvcell='telnet 192.168.2.248 50065'
