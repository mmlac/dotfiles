#!zsh

export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR opens in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI mode


alias em="$EDITOR"
unalias e

function e() {
    emacsclient -a "emacs" $@ &
}
