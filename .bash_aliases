# tmux!
if [ -z "$SSH_TTY" ]; then
    if [[ -z "$TMUX" ]] ;then
        ID="`tmux ls | grep -vm1 attached | cut -d: -f1`" # get the id of a deattached session
        if [[ -z "$ID" ]] ;then # if not available create a new one
            tmux -2 new-session
        else
            tmux -2 attach-session -t "$ID" # if available attach to it
        fi
    fi
else
    if which tmux >/dev/null 2>&1; then
        #if not inside a tmux session, and if no session is started, start a new session
        test -z "$TMUX" && (tmux -2 attach || tmux -2 new-session)
    fi
fi

# keep directory during mr commands
alias mrupdate="pushd $HOME && mr update; popd"
alias mrpush="pushd $HOME && mr push; popd"

# don't mess with me wget
alias gimmedat="wget -r -nH --no-parent --reject="index.html*" -e robots=off"

# colors for tmux
alias tmux="tmux -2"

# htop solarized compatible
alias htop="htop -C"

# more user friendly 'free'
alias free="free -h | egrep --color 'buffers/cache.*|$'"

# more user friendly 'dmesg'
alias dmesg="dmesg -T"

# use case for tar extract
function tarx() {
    tar xfv "$@"
}
alias tarx=tarx

# use case for tar list
alias tarlist="tar tvf"

# open files!
alias open="xdg-open"

# use vim for 'view'
alias view="vim -R"

# previous directory
alias prevdir='cd -'

# dstat
alias dstat='dstat --nocolor'
