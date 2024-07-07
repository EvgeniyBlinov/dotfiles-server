#!/bin/bash
ENV="${ENV:-default}"
if test -f ~/.profile-${ENV}; then
    set -o allexport
    source ~/.profile-${ENV}
    set +o allexport
fi

tmux -L ${ENV} attach ||
    {
        tmux -L ${ENV} -f ~/tmux-${ENV}.conf new-session  \; \
        setenv EDITOR $EDITOR \; \
        setenv VIMDIR $VIMDIR \; \
        send-keys -t 0 "export EDITOR="$EDITOR C-m \; \
        send-keys -t 0 "export VIMDIR="$VIMDIR C-m
    }
