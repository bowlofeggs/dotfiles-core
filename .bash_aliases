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
