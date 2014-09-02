#!/bin/bash
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/' ~/.bashrc

if grep 'tmux' ~/.bashrc
then
    echo 'tmux already configured'
    exit 0
else
# backslash in front of EOF makes everything literal
echo 'adding tmux config to ~/.bashrc'
cat <<\EOF >> ~/.bashrc

# tmux!
if [ -z "$SSH_TTY" ]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
else
    if which tmux >/dev/null 2>&1; then
        #if not inside a tmux session, and if no session is started, start a new session
        test -z "$TMUX" && (tmux attach || tmux new-session)
    fi
fi
EOF
fi
