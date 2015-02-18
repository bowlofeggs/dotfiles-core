# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# color prompt for Debian
# root is red
if [[ $EUID == 0 ]]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# regular users are not red
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# use vim for man pages
export MANPAGER="/bin/sh -c \"col -b | view -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# keep directory during mr commands
alias mrupdate="pushd $HOME && mr update; popd"
alias mrpush="pushd $HOME && mr push; popd"

# don't mess with me wget
alias wgetmess="wget -r -nH --no-parent --reject="index.html*""

# colors for tmux
alias tmux="tmux -2"
