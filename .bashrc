## Own alias's  ##

alias pkill='pgrep $1 | xargs kill'
alias updagra='apt update && apt upgrade'

## Type-o's ##
alias cd..='cd ..'


## todo list ##
##########################################################################
# A few alias's and simple scripts for keeping a todolist in the terminal
##########################################################################

alias todo='echo - [_]"$1">> ~/todo.txt'
alias todolist='cat ~/todo.txt'
alias todobackup='cp -v ~/todo.txt ~/todo.backup'
alias todosort='~/Scripts/./todosort.sh'
alias todosearch='cat ~/todo.txt | grep $1'
alias todoremove='~/Scripts/./todoremove.sh'
alias tododone='~/Scripts/./awktodo.sh'

## Goodies from http://unix.stackexchange.com/questions/6/what-are-your-favorite-command-line-features-or-tricks?page=1&tab=votes#tab-top #
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xjf $1      ;;
            *.tar.gz)   tar xzf $1      ;;
            *.bz2)      bunzip2 $1      ;;
            *.rar)      rar x $1        ;;
            *.gz)       gunzip $1       ;;
            *.tar)      tar xf $1       ;;
            *.tbz2)     tar xjf $1      ;;
            *.tgz)      tar xzf $1      ;;
            *.zip)      unzip $1        ;;
            *.Z)        uncompress $1   ;;
            *)          echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


## Autocomplete for Cheat ##

function _cheat_autocomplete {
    sheets=$(cheat -l | cut -d' ' -f1)
    COMPREPLY=()
    if [ $COMP_CWORD = 1 ]; then
	COMPREPLY=(`compgen -W "$sheets" -- $2`)
    fi
}

complete -F _cheat_autocomplete cheat

# prompt
#PS1='[\u@\h \W]\$ '
# I this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

export PATH=$HOME/local/bin:$PATH

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
