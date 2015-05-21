# include .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# use vim for man pages
export MANPAGER="/bin/sh -c \"col -b | vim -R -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# nmon graphs
export NMON=cmdn.

# kerberos multi!
export KRB5CCNAME=DIR:~/srv/krb5tix

# unlock default ssh key if not already done
if [[ -f ~/.ssh/id_rsa ]]; then
    if [[ ! $(ssh-add -l | grep '.ssh/id_rsa') ]]; then
        ssh-add
    fi
fi
